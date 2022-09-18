USE sqlDB;
SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
	FROM userTBL
	WHERE height >= 180;

SET @json='{"userTBL" :
	[
		{"name":"임재범", "height":182},
		{"name":"이승기", "height":182},
		{"name":"성시경", "height":186}
	]
}';

SELECT JSON_VALID(@json);
SELECT JSON_SEARCH(@json, 'one', '성시경');
SELECT JSON_EXTRACT(@json, '$.userTBL[2].name');
SELECT JSON_INSERT(@json, '$.userTBL[0].mDate', '2009-09-09');
SELECT JSON_REPLACE(@json, '$.userTBL[0].name', '홍길동');
SELECT JSON_REMOVE(@json, '$.userTBL[0]');  

