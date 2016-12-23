// Gráfico sazionalidade dos tweets:

WITH
SET [~ROWS] AS
    Hierarchize({{[Tempo].[Mes].Members}, {[Tempo].[Mes].Members}})
SELECT
NON EMPTY {[Measures].[Quantidade de tweets]} ON COLUMNS,
NON EMPTY [~ROWS] ON ROWS
FROM [Tweet x Likes]

// TOP 3 meses mais ativos

SELECT [Measures].[Quantidade de tweets] on 0,
non empty topcount([Tempo].[Mes].members, 3, [Measures].[Quantidade de tweets]) on 1

FROM [Tweet x Likes]

// TOP 3 meses mais ativos(OUTRA FORMA)

WITH
SET [top3meses] as 'topcount([Tempo].[Mes].members, 3, [Measures].[Quantidade de tweets])'

SELECT [Measures].[Quantidade de tweets] on 0,
non empty [top3meses] on 1

FROM [Tweet x Likes]

// TOP 10 USER LIKES(SQL)

SELECT Screen_name, count(*) nVezes
FROM fato_likes
GROUP BY Screen_name
ORDER BY nVezes DESC
LIMIT 10

// TOP 10 USER MENTIONS(SQL)

SELECT 
	COUNT(dm.screen_name) AS "Numero De Vezes", 
    dm.screen_name 
FROM 
	fato_twitter ft
INNER JOIN dim_usuário_mencionado dm ON (ft.sk_usuario_mencionado = dm.sk_usuario_mencionado)
GROUP BY 
	dm.screen_name
ORDER BY "Numero De Vezes" DESC
LIMIT 10;

// RELAÇÃO QUANTIDADE DE CARACTERES COM A QUANTIDADE DE LIKES E RETWEETS

SELECT 
	ft.tweet_texto, char_length(ft.tweet_texto) as tamanho, ft.likes_count, ft.retweeted_count
FROM
	fato_twitter ft
ORDER BY tamanho DESC;

// TOP 10 TWEETS MAIS CURTIDOS

SELECT 
	ft.tweet_texto, char_length(ft.tweet_texto) as tamanho, ft.likes_count, ft.retweeted_count
FROM
	fato_twitter ft
INNER JOIN dim_usuario d on (ft.sk_usuario = d.sk_usuario)
WHERE d.user_screen_name = 'oncase'
ORDER BY ft.likes_count DESC
LIMIT 10;

// Midia_percent
WITH 
MEMBER [Measures].[Percentual] as
SUM([Measures].[qtd_media])/ SUM([Measures].[Quantidade de tweets]), 
FORMAT_STRING = '###0.00%'
Member [Measures].[Nome] as  "Tweets que contém midia"
SELECT
{[Measures].[Nome],[Measures].[qtd_media], [Measures].[Percentual]} ON 0,
NON EMPTY head([Tempo].[Tudo],1) ON 1
FROM [Tweet x Likes]

// url_percent

SELECT 'URL' AS "URL",
		((SELECT CAST( COUNT(*) AS FLOAT)
        FROM dim_tweet  
        WHERE url_tweet = 'Y')
        /
        (SELECT CAST( COUNT(*) AS FLOAT) FROM dim_tweet)) AS "Percentual"
		