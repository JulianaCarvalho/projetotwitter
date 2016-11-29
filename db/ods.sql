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
-- Name: ods_hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ods_hashtags (
    tweet_id text,
    hashtags text,
    hash text
);


ALTER TABLE ods_hashtags OWNER TO postgres;

--
-- Name: ods_midia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ods_midia (
    tweet_id text,
    media text,
    media_count text
);


ALTER TABLE ods_midia OWNER TO postgres;

--
-- Name: ods_tweets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ods_tweets (
    tweet_id text,
    tweet_texto text,
    hashtags text,
    geo text,
    tweet_data text,
    in_reply_to_status_id_str text,
    usuario_id text,
    usuario_follower_count text,
    retweet_count text,
    user_mentions text,
    "user" text,
    dia_semana character varying(100),
    mes character varying(100),
    dia character varying(100),
    hora character varying(100),
    ano character varying(100),
    data_string_concat text,
    in_reply_to_user_id_str text,
    in_reply_to_screen_name text,
    user_screen_name text
);


ALTER TABLE ods_tweets OWNER TO postgres;

--
-- Name: ods_url; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ods_url (
    tweet_id text,
    tweet_url text
);


ALTER TABLE ods_url OWNER TO postgres;

--
-- Name: ods_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ods_usuario (
    usuario_id text,
    "user" text,
    user_nome text,
    user_screen_name text,
    user_location text,
    user_seguindo double precision,
    user_seguidores double precision,
    user_listas double precision,
    user_curtidas double precision
);


ALTER TABLE ods_usuario OWNER TO postgres;

--
-- Name: ods_usuario_mencionado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ods_usuario_mencionado (
    user_m_screename text,
    user_m_name text,
    user_m_id text,
    tweet_id text
);


ALTER TABLE ods_usuario_mencionado OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

