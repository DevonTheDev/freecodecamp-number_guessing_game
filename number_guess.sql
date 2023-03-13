--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(30),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Westy', 4, 7);
INSERT INTO public.users VALUES ('user_1678702783004', 2, 391);
INSERT INTO public.users VALUES ('user_1678702783005', 5, 71);
INSERT INTO public.users VALUES ('user_1678703141620', 2, 122);
INSERT INTO public.users VALUES ('user_1678703141621', 5, 206);
INSERT INTO public.users VALUES ('user_1678703150952', 2, 115);
INSERT INTO public.users VALUES ('user_1678703150953', 5, 21);
INSERT INTO public.users VALUES ('user_1678703392130', 2, 80);
INSERT INTO public.users VALUES ('user_1678703392131', 5, 136);
INSERT INTO public.users VALUES ('user_1678703482233', 2, 566);
INSERT INTO public.users VALUES ('user_1678703482234', 5, 24);


--
-- PostgreSQL database dump complete
--

