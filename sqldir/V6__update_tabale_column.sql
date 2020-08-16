ALTER TABLE public.mytable DROP COLUMN date;

ALTER TABLE public.mytable DROP COLUMN phone;

ALTER TABLE public.mytable DROP COLUMN test;

ALTER TABLE public.mytable
    ADD COLUMN phone2 character varying(20) COLLATE pg_catalog."default";