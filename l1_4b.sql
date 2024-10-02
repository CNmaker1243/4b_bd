/*
1. Exibir lista de alunos e seus cursos
Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.
*/
create or replace view vw_aluno_disciplina as
select aluno.nome nome_aluno, disciplina.nome nome_disciplina, curso.nome nome_curso
from aluno
inner join matricula on aluno.id_aluno = matricula.id_aluno
inner join disciplina on disciplina.id_disciplina = matricula.id_disciplina
inner join curso on curso.id_curso = disciplina.id_curso;

select * from vw_aluno_disciplina;

/*
2. Exibir total de alunos por disciplina
Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.
*/
create or replace view vw_disciplina_numero_aluno as
select disciplina.nome nome_disciplina, count(aluno.id_aluno) quantidade_aluno
from matricula
inner join disciplina on disciplina.id_disciplina = matricula.id_disciplina
inner join aluno on matricula.id_aluno = aluno.id_aluno
group by disciplina.nome;

select * from vw_disciplina_numero_aluno;