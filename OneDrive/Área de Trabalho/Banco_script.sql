--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- Name: evento; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA evento;


ALTER SCHEMA evento OWNER TO postgres;

--
-- Name: faturamento; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA faturamento;


ALTER SCHEMA faturamento OWNER TO postgres;

--
-- Name: usuario; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA usuario;


ALTER SCHEMA usuario OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artista; Type: TABLE; Schema: evento; Owner: postgres; Tablespace: 
--

CREATE TABLE evento.artista (
    art_codigo integer NOT NULL,
    art_nome character(100),
    art_descricao character(100)
);


ALTER TABLE evento.artista OWNER TO postgres;

--
-- Name: artista_art_codigo_seq; Type: SEQUENCE; Schema: evento; Owner: postgres
--

CREATE SEQUENCE evento.artista_art_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evento.artista_art_codigo_seq OWNER TO postgres;

--
-- Name: artista_art_codigo_seq; Type: SEQUENCE OWNED BY; Schema: evento; Owner: postgres
--

ALTER SEQUENCE evento.artista_art_codigo_seq OWNED BY evento.artista.art_codigo;


--
-- Name: evento; Type: TABLE; Schema: evento; Owner: postgres; Tablespace: 
--

CREATE TABLE evento.evento (
    eve_codigo integer NOT NULL,
    loc_codigo integer,
    art_codigo integer,
    tie_codigo integer,
    usr_codigo_aberturo integer,
    eve_titulo character(50),
    eve_quantidade_ingressos integer,
    eve_valor_ingresso double precision
);


ALTER TABLE evento.evento OWNER TO postgres;

--
-- Name: local; Type: TABLE; Schema: evento; Owner: postgres; Tablespace: 
--

CREATE TABLE evento.local (
    loc_codigo integer NOT NULL,
    loc_logradouro character(255) NOT NULL,
    loc_numero character(10) NOT NULL,
    loc_bairro character(100) NOT NULL,
    loc_cidade character(100) NOT NULL,
    loc_uf character(50) NOT NULL
);


ALTER TABLE evento.local OWNER TO postgres;

--
-- Name: local_loc_codigo_seq; Type: SEQUENCE; Schema: evento; Owner: postgres
--

CREATE SEQUENCE evento.local_loc_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evento.local_loc_codigo_seq OWNER TO postgres;

--
-- Name: local_loc_codigo_seq; Type: SEQUENCE OWNED BY; Schema: evento; Owner: postgres
--

ALTER SEQUENCE evento.local_loc_codigo_seq OWNED BY evento.local.loc_codigo;


--
-- Name: tipo_evento; Type: TABLE; Schema: evento; Owner: postgres; Tablespace: 
--

CREATE TABLE evento.tipo_evento (
    tie_codigo integer NOT NULL,
    tie_descricao character(100)
);


ALTER TABLE evento.tipo_evento OWNER TO postgres;

--
-- Name: tipo_evento_tie_codigo_seq; Type: SEQUENCE; Schema: evento; Owner: postgres
--

CREATE SEQUENCE evento.tipo_evento_tie_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evento.tipo_evento_tie_codigo_seq OWNER TO postgres;

--
-- Name: tipo_evento_tie_codigo_seq; Type: SEQUENCE OWNED BY; Schema: evento; Owner: postgres
--

ALTER SEQUENCE evento.tipo_evento_tie_codigo_seq OWNED BY evento.tipo_evento.tie_codigo;


--
-- Name: forma_pagamento; Type: TABLE; Schema: faturamento; Owner: postgres; Tablespace: 
--

CREATE TABLE faturamento.forma_pagamento (
    fop_codigo integer NOT NULL,
    fop_descricao character(50)
);


ALTER TABLE faturamento.forma_pagamento OWNER TO postgres;

--
-- Name: forma_pagamento_fop_codigo_seq; Type: SEQUENCE; Schema: faturamento; Owner: postgres
--

CREATE SEQUENCE faturamento.forma_pagamento_fop_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE faturamento.forma_pagamento_fop_codigo_seq OWNER TO postgres;

--
-- Name: forma_pagamento_fop_codigo_seq; Type: SEQUENCE OWNED BY; Schema: faturamento; Owner: postgres
--

ALTER SEQUENCE faturamento.forma_pagamento_fop_codigo_seq OWNED BY faturamento.forma_pagamento.fop_codigo;


--
-- Name: situacao_venda; Type: TABLE; Schema: faturamento; Owner: postgres; Tablespace: 
--

CREATE TABLE faturamento.situacao_venda (
    siv_codigo integer NOT NULL,
    siv_descricao character(50)
);


ALTER TABLE faturamento.situacao_venda OWNER TO postgres;

--
-- Name: venda; Type: TABLE; Schema: faturamento; Owner: postgres; Tablespace: 
--

CREATE TABLE faturamento.venda (
    ven_codigo integer NOT NULL,
    siv_codigo integer,
    vep_codigo integer,
    usr_codigo integer,
    eve_codigo integer
);


ALTER TABLE faturamento.venda OWNER TO postgres;

--
-- Name: venda_ingresso; Type: TABLE; Schema: faturamento; Owner: postgres; Tablespace: 
--

CREATE TABLE faturamento.venda_ingresso (
    vel_codigo integer NOT NULL,
    ven_codigo integer,
    vel_nome character(50),
    vel_documento character(50),
    vel_utilizado boolean
);


ALTER TABLE faturamento.venda_ingresso OWNER TO postgres;

--
-- Name: venda_pagamento; Type: TABLE; Schema: faturamento; Owner: postgres; Tablespace: 
--

CREATE TABLE faturamento.venda_pagamento (
    vep_codigo integer NOT NULL,
    vep_valor double precision,
    vep_qtd_parcelas integer,
    fop_codigo integer
);


ALTER TABLE faturamento.venda_pagamento OWNER TO postgres;

--
-- Name: controle_acesso; Type: TABLE; Schema: usuario; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario.controle_acesso (
    usr_codigo integer,
    coa_codigo integer NOT NULL,
    coa_data date
);


ALTER TABLE usuario.controle_acesso OWNER TO postgres;

--
-- Name: controle_acesso_coa_codigo_seq; Type: SEQUENCE; Schema: usuario; Owner: postgres
--

CREATE SEQUENCE usuario.controle_acesso_coa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario.controle_acesso_coa_codigo_seq OWNER TO postgres;

--
-- Name: controle_acesso_coa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: usuario; Owner: postgres
--

ALTER SEQUENCE usuario.controle_acesso_coa_codigo_seq OWNED BY usuario.controle_acesso.coa_codigo;


--
-- Name: nivel; Type: TABLE; Schema: usuario; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario.nivel (
    nvl_codigo integer NOT NULL,
    nvl_descricao character(100)
);


ALTER TABLE usuario.nivel OWNER TO postgres;

--
-- Name: nivel_nvl_codigo_seq; Type: SEQUENCE; Schema: usuario; Owner: postgres
--

CREATE SEQUENCE usuario.nivel_nvl_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario.nivel_nvl_codigo_seq OWNER TO postgres;

--
-- Name: nivel_nvl_codigo_seq; Type: SEQUENCE OWNED BY; Schema: usuario; Owner: postgres
--

ALTER SEQUENCE usuario.nivel_nvl_codigo_seq OWNED BY usuario.nivel.nvl_codigo;


--
-- Name: usuario; Type: TABLE; Schema: usuario; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario.usuario (
    usr_codigo integer NOT NULL,
    nlv_codigo integer,
    usr_nome character(100),
    usr_email character(50),
    usr_login character(50),
    usr_senha character(50),
    usr_ativo boolean
);


ALTER TABLE usuario.usuario OWNER TO postgres;

--
-- Name: usuario_usr_codigo_seq; Type: SEQUENCE; Schema: usuario; Owner: postgres
--

CREATE SEQUENCE usuario.usuario_usr_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario.usuario_usr_codigo_seq OWNER TO postgres;

--
-- Name: usuario_usr_codigo_seq; Type: SEQUENCE OWNED BY; Schema: usuario; Owner: postgres
--

ALTER SEQUENCE usuario.usuario_usr_codigo_seq OWNED BY usuario.usuario.usr_codigo;


--
-- Name: art_codigo; Type: DEFAULT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.artista ALTER COLUMN art_codigo SET DEFAULT nextval('evento.artista_art_codigo_seq'::regclass);


--
-- Name: loc_codigo; Type: DEFAULT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.local ALTER COLUMN loc_codigo SET DEFAULT nextval('evento.local_loc_codigo_seq'::regclass);


--
-- Name: tie_codigo; Type: DEFAULT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.tipo_evento ALTER COLUMN tie_codigo SET DEFAULT nextval('evento.tipo_evento_tie_codigo_seq'::regclass);


--
-- Name: fop_codigo; Type: DEFAULT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.forma_pagamento ALTER COLUMN fop_codigo SET DEFAULT nextval('faturamento.forma_pagamento_fop_codigo_seq'::regclass);


--
-- Name: coa_codigo; Type: DEFAULT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.controle_acesso ALTER COLUMN coa_codigo SET DEFAULT nextval('usuario.controle_acesso_coa_codigo_seq'::regclass);


--
-- Name: nvl_codigo; Type: DEFAULT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.nivel ALTER COLUMN nvl_codigo SET DEFAULT nextval('usuario.nivel_nvl_codigo_seq'::regclass);


--
-- Name: usr_codigo; Type: DEFAULT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.usuario ALTER COLUMN usr_codigo SET DEFAULT nextval('usuario.usuario_usr_codigo_seq'::regclass);


--
-- Name: art_codigo; Type: CONSTRAINT; Schema: evento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento.artista
    ADD CONSTRAINT art_codigo PRIMARY KEY (art_codigo);


--
-- Name: eve_codigo; Type: CONSTRAINT; Schema: evento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento.evento
    ADD CONSTRAINT eve_codigo PRIMARY KEY (eve_codigo);


--
-- Name: loc_codigo; Type: CONSTRAINT; Schema: evento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento.local
    ADD CONSTRAINT loc_codigo PRIMARY KEY (loc_codigo);


--
-- Name: tie_codigo; Type: CONSTRAINT; Schema: evento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento.tipo_evento
    ADD CONSTRAINT tie_codigo PRIMARY KEY (tie_codigo);


--
-- Name: fop_codigo; Type: CONSTRAINT; Schema: faturamento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faturamento.forma_pagamento
    ADD CONSTRAINT fop_codigo PRIMARY KEY (fop_codigo);


--
-- Name: siv_codigo; Type: CONSTRAINT; Schema: faturamento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faturamento.situacao_venda
    ADD CONSTRAINT siv_codigo PRIMARY KEY (siv_codigo);


--
-- Name: vel_codigo; Type: CONSTRAINT; Schema: faturamento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faturamento.venda_ingresso
    ADD CONSTRAINT vel_codigo PRIMARY KEY (vel_codigo);


--
-- Name: ven_codigo; Type: CONSTRAINT; Schema: faturamento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faturamento.venda
    ADD CONSTRAINT ven_codigo PRIMARY KEY (ven_codigo);


--
-- Name: vep_codigo; Type: CONSTRAINT; Schema: faturamento; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faturamento.venda_pagamento
    ADD CONSTRAINT vep_codigo PRIMARY KEY (vep_codigo);


--
-- Name: coa_codigo; Type: CONSTRAINT; Schema: usuario; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario.controle_acesso
    ADD CONSTRAINT coa_codigo PRIMARY KEY (coa_codigo);


--
-- Name: nivel_pkey; Type: CONSTRAINT; Schema: usuario; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario.nivel
    ADD CONSTRAINT nivel_pkey PRIMARY KEY (nvl_codigo);


--
-- Name: usr_codigo; Type: CONSTRAINT; Schema: usuario; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT usr_codigo PRIMARY KEY (usr_codigo);


--
-- Name: art_codigo; Type: FK CONSTRAINT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.evento
    ADD CONSTRAINT art_codigo FOREIGN KEY (art_codigo) REFERENCES evento.artista(art_codigo);


--
-- Name: loc_codigo; Type: FK CONSTRAINT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.evento
    ADD CONSTRAINT loc_codigo FOREIGN KEY (loc_codigo) REFERENCES evento.local(loc_codigo);


--
-- Name: tie_codigo; Type: FK CONSTRAINT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.evento
    ADD CONSTRAINT tie_codigo FOREIGN KEY (tie_codigo) REFERENCES evento.tipo_evento(tie_codigo);


--
-- Name: usr_codigo_abertura; Type: FK CONSTRAINT; Schema: evento; Owner: postgres
--

ALTER TABLE ONLY evento.evento
    ADD CONSTRAINT usr_codigo_abertura FOREIGN KEY (usr_codigo_aberturo) REFERENCES usuario.usuario(usr_codigo);


--
-- Name: fop_codigo; Type: FK CONSTRAINT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.venda_pagamento
    ADD CONSTRAINT fop_codigo FOREIGN KEY (fop_codigo) REFERENCES faturamento.forma_pagamento(fop_codigo);


--
-- Name: siv_codigo; Type: FK CONSTRAINT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.venda
    ADD CONSTRAINT siv_codigo FOREIGN KEY (siv_codigo) REFERENCES faturamento.situacao_venda(siv_codigo);


--
-- Name: usr_codigo; Type: FK CONSTRAINT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.venda
    ADD CONSTRAINT usr_codigo FOREIGN KEY (usr_codigo) REFERENCES usuario.usuario(usr_codigo);


--
-- Name: ven_codigo; Type: FK CONSTRAINT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.venda_ingresso
    ADD CONSTRAINT ven_codigo FOREIGN KEY (ven_codigo) REFERENCES faturamento.venda(ven_codigo);


--
-- Name: venda_eve_codigo_fkey; Type: FK CONSTRAINT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.venda
    ADD CONSTRAINT venda_eve_codigo_fkey FOREIGN KEY (eve_codigo) REFERENCES evento.evento(eve_codigo);


--
-- Name: vep_codigo; Type: FK CONSTRAINT; Schema: faturamento; Owner: postgres
--

ALTER TABLE ONLY faturamento.venda
    ADD CONSTRAINT vep_codigo FOREIGN KEY (vep_codigo) REFERENCES faturamento.venda_pagamento(vep_codigo);


--
-- Name: nlv_codigo; Type: FK CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT nlv_codigo FOREIGN KEY (nlv_codigo) REFERENCES usuario.nivel(nvl_codigo);


--
-- Name: usr_codigo; Type: FK CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.controle_acesso
    ADD CONSTRAINT usr_codigo FOREIGN KEY (usr_codigo) REFERENCES usuario.usuario(usr_codigo);


--
-- PostgreSQL database dump complete
--

