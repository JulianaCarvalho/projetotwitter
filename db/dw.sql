--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dim_hashtag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dim_hashtag (
    tweet_id text,
    hashtags text,
    hash text,
    sk_hashtag double precision
);


ALTER TABLE dim_hashtag OWNER TO postgres;

--
-- Name: dim_midia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dim_midia (
    tweet_id text,
    media text,
    media_count text,
    sk_midia double precision
);


ALTER TABLE dim_midia OWNER TO postgres;

--
-- Name: dim_tempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dim_tempo (
    start_day timestamp without time zone,
    days_since double precision,
    "Date" timestamp without time zone,
    "Year" double precision,
    "Month" double precision,
    dayofyear double precision,
    dayofmonth double precision,
    dayofweek double precision,
    weekofyear double precision,
    date_tk double precision,
    dayofweekdesc text,
    dayofweekshortdesc text,
    monthdesc text,
    monthshortdesc text,
    data_string text,
    sk_tempo double precision
);


ALTER TABLE dim_tempo OWNER TO postgres;

--
-- Name: dim_url; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dim_url (
    tweet_id text,
    tweet_url text,
    sk_url double precision
);


ALTER TABLE dim_url OWNER TO postgres;

--
-- Name: dim_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dim_usuario (
    usuario_id text,
    "user" text,
    user_nome text,
    user_screen_name text,
    user_location text,
    user_seguindo double precision,
    user_seguidores double precision,
    user_listas double precision,
    user_curtidas double precision,
    sk_usuario double precision
);


ALTER TABLE dim_usuario OWNER TO postgres;

--
-- Name: dim_usuário_mencionado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "dim_usuário_mencionado" (
    user_m_screename text,
    user_m_name text,
    user_m_id text,
    tweet_id text,
    sk_usuario_mencionado double precision
);


ALTER TABLE "dim_usuário_mencionado" OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

