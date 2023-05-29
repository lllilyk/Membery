USE membery;
SELECT * FROM Feed ORDER BY id DESC;
SELECT * FROM File ORDER BY id DESC;

DELETE FROM Feed WHERE id = 36;

DESC Feed;
DESC File;

SELECT 
				fd.id,
				fd.title,
				fd.content,
				fd.writer,
				fd.inserted,
				fd.location,
				fl.fileName,
				fl.feedId
			FROM Feed fd LEFT JOIN File fl ON fd.id = fl.feedId
			WHERE fd.id = 37;