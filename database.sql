toc.dat                                                                                             0000600 0004000 0002000 00000005556 14264521426 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       6                    z            node_js #   13.5 (Ubuntu 13.5-0ubuntu0.21.04.1) #   13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         ?           1262    17070    node_js    DATABASE     \   CREATE DATABASE node_js WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE node_js;
                postgres    false         ?            1259    17094 	   customers    TABLE     >  CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(200),
    last_name character varying(200),
    state character varying(100),
    country character varying(250),
    "createdAt" timestamp with time zone DEFAULT now(),
    "updatedAt" timestamp with time zone DEFAULT now()
);
    DROP TABLE public.customers;
       public         heap    postgres    false         ?            1259    17103    customers_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9875454544
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    200         ?           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    201         I           2604    17105    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200         ?          0    17094 	   customers 
   TABLE DATA           h   COPY public.customers (id, first_name, last_name, state, country, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    200       3023.dat ?           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 10, true);
          public          postgres    false    201         L           2606    17102    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    200                                                                                                                                                          3023.dat                                                                                            0000600 0004000 0002000 00000001045 14264521426 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Jay	Prajapati	gujrat	india	2022-07-02 12:45:24.239526+05:45	2022-07-16 15:40:51.096027+05:45
2	Jay	Prajapati	gujrat	india	2022-07-02 12:46:00.111675+05:45	2022-07-16 15:40:51.096027+05:45
3	Hellow	World	California	USA	2022-07-02 14:39:48.48116+05:45	2022-07-16 15:40:51.096027+05:45
4	abc	xyz	gujrat	India	2022-07-16 14:56:45.499683+05:45	2022-07-16 16:00:47.916+05:45
6	abc	xyz	gujrat	India	2022-07-16 16:01:03.356+05:45	2022-07-16 16:01:03.356+05:45
7	sdfsdf	sdfsdf	sdfsdf	sdfsdf	2022-07-16 16:52:02.359+05:45	2022-07-16 16:52:02.359+05:45
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000005774 14264521426 0015407 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)

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

DROP DATABASE node_js;
--
-- Name: node_js; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE node_js WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE node_js OWNER TO postgres;

\connect node_js

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(200),
    last_name character varying(200),
    state character varying(100),
    country character varying(250),
    "createdAt" timestamp with time zone DEFAULT now(),
    "updatedAt" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9875454544
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, state, country, "createdAt", "updatedAt") FROM stdin;
\.
COPY public.customers (id, first_name, last_name, state, country, "createdAt", "updatedAt") FROM '$$PATH$$/3023.dat';

--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    