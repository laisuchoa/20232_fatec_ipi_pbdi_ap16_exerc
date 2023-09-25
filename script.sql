CREATE TABLE tb_top_youtubers(
	cod_top_youtubers SERIAL PRIMARY KEY,
	rank INT,
	youtuber VARCHAR(200),
	subscribers INT,
	video_views VARCHAR(200),
	video_count INT,
	category VARCHAR(200),
	started INT
);

SELECT * FROM tb_top_youtubers;

-- 1.1 Escreva um cursor que exiba as variáveis rank e youtuber de toda tupla que tiver video_count pelo menos igual a 1000 e cuja category seja igual a Sports ou Music.

DO
$$
DECLARE
  cur_top_youtubers CURSOR FOR
    SELECT rank, youtuber FROM tb_top_youtubers WHERE video_count >= 1000 AND (category = 'Sports ' OR category = 'Music ');
  v_rank INT;
  v_youtuber VARCHAR(200);
BEGIN
  OPEN cur_top_youtubers;
  LOOP
    FETCH cur_top_youtubers INTO v_rank, v_youtuber;
    EXIT WHEN NOT FOUND;
    RAISE NOTICE 'Rank: %, Youtuber: %', v_rank, v_youtuber;
  END LOOP;
  CLOSE cur_top_youtubers;
END;
$$;

--1.2 Escreva um cursor que exibe todos os nomes dos youtubers em ordem reversa. Para tal: O SELECT deverá ordenar em ordem não reversa; O Cursor deverá ser movido para a última tupla; Os dados deverão ser exibidos de baixo para cima.



--1.3 Faça uma pesquisa sobre o anti-pattern chamado RBAR - Row By Agonizing Row. Explique com suas palavras do que se trata.

