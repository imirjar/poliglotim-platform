--
-- PostgreSQL database dump
--

\restrict gTzpv8zJH6WID1WgiWoZ2JdKEmqeeu2SetRGGObpCPN1OOHZyOA9ViYU9nArVdZ

-- Dumped from database version 17.4 (Ubuntu 17.4-1.pgdg24.04+2)
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-03 19:42:02 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16434)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16404)
-- Name: chapters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chapters (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    course_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "position" integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16395)
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    logo_path character varying(512),
    is_published boolean DEFAULT false NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lessons (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    chapter_id uuid,
    title text NOT NULL,
    text text NOT NULL,
    updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 3437 (class 0 OID 16404)
-- Dependencies: 219
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.chapters VALUES ('15d62d51-eaf8-4cd2-9062-dd93d31a702e', 'bd8e6d90-8617-4397-8b13-0c7afd1d294a', 'Основы китайского', 'Изучение пиньиня и основных фраз', '2025-07-12 02:13:54.939137+03', 1);
INSERT INTO public.chapters VALUES ('480e5316-05e1-4f0c-aacd-73ba1f60cdf0', 'bd8e6d90-8617-4397-8b13-0c7afd1d294a', 'Иероглифика', 'Основные иероглифы и правила написания', '2025-07-12 02:13:54.939137+03', 2);
INSERT INTO public.chapters VALUES ('c706551b-9905-4bc7-a492-59950cebd0e9', 'bd8e6d90-8617-4397-8b13-0c7afd1d294a', 'Грамматика', 'Порядок слов и основные грамматические конструкции', '2025-07-12 02:13:54.939137+03', 3);
INSERT INTO public.chapters VALUES ('59bfef78-d6c8-4ca3-b9f3-63b02426b65c', 'bd8e6d90-8617-4397-8b13-0c7afd1d294a', 'Разговорная практика', 'Типичные диалоги и ситуации общения', '2025-07-12 02:13:54.939137+03', 4);
INSERT INTO public.chapters VALUES ('684774c9-8966-4830-a6f9-c4d4b685c2a6', 'bd8e6d90-8617-4397-8b13-0c7afd1d294a', 'Культура Китая', 'Традиции, обычаи и деловой этикет', '2025-07-12 02:13:54.939137+03', 5);
INSERT INTO public.chapters VALUES ('69a52fb9-cc62-4fbe-844e-a084fa741982', 'fdb2eb82-20e6-4cd6-b1c8-9bdefa38730e', 'Французское произношение', 'Особенности фонетики и nasal sounds', '2025-07-12 02:13:54.939137+03', 1);
INSERT INTO public.chapters VALUES ('edb93a92-92b9-44c6-9a00-603f9f49d7bd', 'fdb2eb82-20e6-4cd6-b1c8-9bdefa38730e', 'Грамматика', 'Род, число, спряжение глаголов', '2025-07-12 02:13:54.939137+03', 2);
INSERT INTO public.chapters VALUES ('deef9537-69a1-4cc7-bebb-771a52ef58d0', 'fdb2eb82-20e6-4cd6-b1c8-9bdefa38730e', 'Разговорный французский', 'Повседневные выражения и диалоги', '2025-07-12 02:13:54.939137+03', 3);
INSERT INTO public.chapters VALUES ('1a69f62c-03e2-48ff-9860-02e349561f53', 'fdb2eb82-20e6-4cd6-b1c8-9bdefa38730e', 'Французская литература', 'Знакомство с классическими произведениями', '2025-07-12 02:13:54.939137+03', 4);
INSERT INTO public.chapters VALUES ('d1f1b5b9-59ab-48ba-9383-f52ad03a48b5', 'fdb2eb82-20e6-4cd6-b1c8-9bdefa38730e', 'Культура Франции', 'Искусство, мода, кухня', '2025-07-12 02:13:54.939137+03', 5);
INSERT INTO public.chapters VALUES ('bb9b2e70-506d-4a73-9332-456d90efbbb0', '9aa1af6d-8316-4e23-a758-5c98f64dbb5d', 'Основы испанского', 'Алфавит и произношение', '2025-07-12 02:13:54.939137+03', 1);
INSERT INTO public.chapters VALUES ('e9ff4bfb-fdc3-4228-ae25-8ab651c46a64', '9aa1af6d-8316-4e23-a758-5c98f64dbb5d', 'Грамматика', 'Артикли, спряжение глаголов, времена', '2025-07-12 02:13:54.939137+03', 2);
INSERT INTO public.chapters VALUES ('a07a200e-47f0-4b53-b9b1-bb144ed3b2b3', '9aa1af6d-8316-4e23-a758-5c98f64dbb5d', 'Латиноамериканский вариант', 'Особенности испанского в Латинской Америке', '2025-07-12 02:13:54.939137+03', 3);
INSERT INTO public.chapters VALUES ('a727834f-6eb4-484e-b28c-2eda74f3cdad', '9aa1af6d-8316-4e23-a758-5c98f64dbb5d', 'Испанский для путешествий', 'Полезные фразы для туристов', '2025-07-12 02:13:54.939137+03', 4);
INSERT INTO public.chapters VALUES ('74f717a1-6c58-46b9-95d9-3ce722045b9f', '9aa1af6d-8316-4e23-a758-5c98f64dbb5d', 'Культура испаноязычных стран', 'Традиции и праздники', '2025-07-12 02:13:54.939137+03', 5);
INSERT INTO public.chapters VALUES ('4be43519-e85b-4a47-afe5-c583e5146f99', '598b51ba-b110-4306-9403-830bab1c826e', 'Хангыль', 'Изучение корейского алфавита', '2025-07-12 02:13:54.939137+03', 1);
INSERT INTO public.chapters VALUES ('17093efb-65c0-46ff-937a-09a594554fb1', '598b51ba-b110-4306-9403-830bab1c826e', 'Основы грамматики', 'Частицы и порядок слов', '2025-07-12 02:13:54.939137+03', 2);
INSERT INTO public.chapters VALUES ('66d3f218-4b21-4f71-96f1-4971e63a6fa6', '598b51ba-b110-4306-9403-830bab1c826e', 'Вежливые формы', 'Система вежливости в корейском языке', '2025-07-12 02:13:54.939137+03', 3);
INSERT INTO public.chapters VALUES ('7b368e21-aa9c-4a77-ac61-d81ec87bf4aa', '598b51ba-b110-4306-9403-830bab1c826e', 'Разговорный корейский', 'Повседневные выражения', '2025-07-12 02:13:54.939137+03', 4);
INSERT INTO public.chapters VALUES ('1d6af92b-aa67-450c-93d2-e190b13a5e33', '598b51ba-b110-4306-9403-830bab1c826e', 'Корейская поп-культура', 'K-pop, дорамы и современные тенденции', '2025-07-12 02:13:54.939137+03', 5);
INSERT INTO public.chapters VALUES ('aa84a2ed-29d5-4001-8e85-9b334eb749b2', 'fe292448-03ef-4d2c-bd2b-7266fde9da92', 'Письменность', 'Хирагана, катакана и базовые кандзи', '2025-07-12 02:13:54.939137+03', 1);
INSERT INTO public.chapters VALUES ('3664420b-9d30-4672-b610-f4ef4b223140', 'fe292448-03ef-4d2c-bd2b-7266fde9da92', 'Грамматика', 'Частицы и структура предложения', '2025-07-12 02:13:54.939137+03', 2);
INSERT INTO public.chapters VALUES ('9e68401c-3fb7-4136-8fe8-8fedd1b34be3', 'fe292448-03ef-4d2c-bd2b-7266fde9da92', 'Вежливые формы', 'Кейго (формальные стили речи)', '2025-07-12 02:13:54.939137+03', 3);
INSERT INTO public.chapters VALUES ('484647b1-4325-4f56-8769-64ee279dbce7', 'fe292448-03ef-4d2c-bd2b-7266fde9da92', 'Разговорный японский', 'Повседневные диалоги', '2025-07-12 02:13:54.939137+03', 4);
INSERT INTO public.chapters VALUES ('55375bd7-16d2-4bf9-84fc-d9f55c6c58ce', 'fe292448-03ef-4d2c-bd2b-7266fde9da92', 'Японская культура', 'Традиции, аниме и современное общество', '2025-07-12 02:13:54.939137+03', 5);
INSERT INTO public.chapters VALUES ('39c44b39-4360-408d-bc31-35fb85b1ce7f', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Буквы, правила чтения', 'Изучение английского алфавита и основных правил чтения', '2025-08-13 23:52:37.697269+03', 1);
INSERT INTO public.chapters VALUES ('2e1759b4-af68-4781-9c3f-c96d578cc1bc', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Артикли', 'Изучение артиклей: a, an, the', '2025-08-13 23:52:37.697269+03', 2);
INSERT INTO public.chapters VALUES ('443a2cc8-c375-4eaa-b190-6d4d4eff4eaf', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Повелительное наклонение, императив', 'Формы и использование повелительного наклонения', '2025-08-13 23:52:37.697269+03', 3);
INSERT INTO public.chapters VALUES ('14840148-1758-4be4-9478-b7a06a7fc993', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Числа', 'Изучение числительных в английском языке', '2025-08-13 23:52:37.697269+03', 4);
INSERT INTO public.chapters VALUES ('083db80d-99d4-489d-ad22-e9ed54685216', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'This, that – these, those', 'Указательные местоимения в английском языке', '2025-08-13 23:52:37.697269+03', 5);
INSERT INTO public.chapters VALUES ('84183a93-0132-4ece-b8b6-71a17ab91b5c', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Предлоги места', 'Изучение предлогов, указывающих местоположение', '2025-08-13 23:52:37.697269+03', 6);
INSERT INTO public.chapters VALUES ('654226b1-f5c4-4a39-bcef-b9e1cb2b985b', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'There is, there are', 'Конструкции для указания наличия чего-либо', '2025-08-13 23:52:37.697269+03', 7);
INSERT INTO public.chapters VALUES ('7bdda60f-4784-4b01-96c6-e867778f8a16', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Цвета, прилагательные', 'Названия цветов и базовые прилагательные', '2025-08-13 23:52:37.697269+03', 8);
INSERT INTO public.chapters VALUES ('bbb7160c-9265-4d49-ae08-9f8e3fb332db', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Present Continuous', 'Настоящее продолженное время', '2025-08-13 23:52:37.697269+03', 9);
INSERT INTO public.chapters VALUES ('d50088cf-0380-4703-bdd8-2fe69c1cae8d', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Местоимения', 'Личные и притяжательные местоимения', '2025-08-13 23:52:37.697269+03', 10);
INSERT INTO public.chapters VALUES ('36976c25-f1f0-4060-ac2f-7cf0dca98c19', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Have got, has got', 'Конструкции для обозначения владения', '2025-08-13 23:52:37.697269+03', 11);
INSERT INTO public.chapters VALUES ('5e561b6a-afa8-426d-9542-2ca110b77a08', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Present Simple, наречия частотности', 'Настоящее простое время и указатели частоты действий', '2025-08-13 23:52:37.697269+03', 12);
INSERT INTO public.chapters VALUES ('51c26ca9-65c8-4606-83cc-417d4a9709ab', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Показатели количества', 'Использование many, much, some и других количественных показателей', '2025-08-13 23:52:37.697269+03', 13);
INSERT INTO public.chapters VALUES ('a7c459ee-d431-48ab-add9-81a6ca59e264', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Can', 'Модальный глагол can и его использование', '2025-08-13 23:52:37.697269+03', 14);
INSERT INTO public.chapters VALUES ('743606ee-b2c0-436a-976a-3c807d75285a', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'May – can', 'Различия между модальными глаголами may и can', '2025-08-13 23:52:37.697269+03', 15);
INSERT INTO public.chapters VALUES ('9f0034bd-9d97-4bc2-b1a5-bffc6e672e66', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Предложения', 'Типы предложений в английском языке', '2025-08-13 23:52:37.697269+03', 16);
INSERT INTO public.chapters VALUES ('bfaa8e46-c26c-4b88-badd-c35aa4033237', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Порядковые числительные, называем даты', 'Образование и использование порядковых числительных', '2025-08-13 23:52:37.697269+03', 17);
INSERT INTO public.chapters VALUES ('39fe865e-7a37-4143-943c-d213b6aaccd0', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Будущее время', 'Future Simple и конструкция going to для выражения будущего', '2025-08-13 23:52:37.697269+03', 18);
INSERT INTO public.chapters VALUES ('ad698e4c-9cdb-4a5c-ba47-55533e55ab0a', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Past Simple', 'Прошедшее простое время', '2025-08-13 23:52:37.697269+03', 19);
INSERT INTO public.chapters VALUES ('d99d1198-0567-4530-b624-902e20114d21', '0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Степени сравнения прилагательных', 'Образование сравнительной и превосходной степени прилагательных', '2025-08-13 23:52:37.697269+03', 20);


--
-- TOC entry 3436 (class 0 OID 16395)
-- Dependencies: 218
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courses VALUES ('fdb2eb82-20e6-4cd6-b1c8-9bdefa38730e', 'Французский язык', 'Изучение французского языка и культуры Франции', '2025-07-12 02:09:04.879321+03', '/logos/french.png', false);
INSERT INTO public.courses VALUES ('9aa1af6d-8316-4e23-a758-5c98f64dbb5d', 'Испанский язык', 'Курс испанского языка для начинающих и продолжающих', '2025-07-12 02:09:04.879321+03', '/logos/spanish.png', false);
INSERT INTO public.courses VALUES ('598b51ba-b110-4306-9403-830bab1c826e', 'Корейский язык', 'Изучение корейского языка и корейской культуры', '2025-07-12 02:09:04.879321+03', '/logos/korean.png', false);
INSERT INTO public.courses VALUES ('0e60c1a1-4e1a-47ca-88f5-40e1dd703260', 'Английский язык', 'Курс по изучению английского языка для всех уровней', '2025-07-12 02:09:04.879321+03', '/logos/english.png', true);
INSERT INTO public.courses VALUES ('fe292448-03ef-4d2c-bd2b-7266fde9da92', 'Японский язык', 'Курс по изучению японского языка и письменности', '2025-07-12 02:08:44.521791+03', '/logos/japanese.png', false);
INSERT INTO public.courses VALUES ('bd8e6d90-8617-4397-8b13-0c7afd1d294a', 'Китайский язык', 'Курс по изучению китайского языка и культуры', '2025-07-12 02:09:04.879321+03', '/logos/chinese.png', false);


--
-- TOC entry 3438 (class 0 OID 16420)
-- Dependencies: 220
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lessons VALUES ('d3acaf5f-efc2-407d-bab0-be6ceb164969', '15d62d51-eaf8-4cd2-9062-dd93d31a702e', 'Введение в китайский язык', '# Введение в китайский язык

## Основные особенности:
- Тональный язык (4 основных тона)
- Логическая грамматика
- Иероглифическая письменность

### Основные фразы:
- 你好 (nǐ hǎo) - Здравствуйте
- 谢谢 (xiè xiè) - Спасибо
- 再见 (zài jiàn) - До свидания', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('e3a23ede-e223-4214-87ee-6fd94d77a823', '15d62d51-eaf8-4cd2-9062-dd93d31a702e', 'Пиньинь - фонетическая система', '# Пиньинь (拼音)

**Пиньинь** - система романизации китайского языка.

## Основные правила:
1. Слоги делятся на инициали и финали
2. Тоны обозначаются надстрочными знаками:
   - mā (первый тон)
   - má (второй тон)
   - mǎ (третий тон)
   - mà (четвертый тон)

Пример:
```pinyin
nǐ hǎo - hello
wǒ - я
tā - он/она
```', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('13b91f1f-e8d4-411e-9ae5-d8022f09eee4', '4be43519-e85b-4a47-afe5-c583e5146f99', 'История хангыля', '# История корейского алфавита

**Хангыль** (한글) был создан в 1443 году королем Седжоном Великим.

## Основные принципы:
- Философия инь и ян
- Форма букв имитирует положение органов речи
- Научный подход к классификации звуков

> "Мудрый может выучить хангыль за утро, 
> а глупый - за 10 дней." 
> - Король Седжон', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('9a7d8f27-595e-40bf-9251-d4479513cd56', '4be43519-e85b-4a47-afe5-c583e5146f99', 'Основные буквы хангыля', '# Базовые буквы хангыля

## Согласные:
| Буква | Произношение |
|-------|--------------|
| ㄱ    | г/к          |
| ㄴ    | н            |
| ㄷ    | д/т          |
| ㅁ    | м            |
| ㅂ    | б/п          |

## Гласные:
| Буква | Произношение |
|-------|--------------|
| ㅏ    | а            |
| ㅓ    | о            |
| ㅗ    | о            |
| ㅜ    | у            |
| ㅡ    | ы            |

Буквы объединяются в слоговые блоки, например: 한 (хан), 글 (гыль)', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('116f8a9d-3fa6-42de-9136-29c501a353eb', 'aa84a2ed-29d5-4001-8e85-9b334eb749b2', 'Хирагана - японская слоговая азбука', '# Хирагана (ひらがな)

Хирагана используется для:
1. Записи исконно японских слов
2. Грамматических частиц
3. Фуриганы (подписи чтения кандзи)

## Основные строки:
あ а    い и    う у    え э    お о  
か ка   き ки   く ку   け кэ   こ ко  
さ са   し си   す су   せ сэ   そ со  

**Запомните:**  
し → "си", а не "ши"  
つ → "цу", а не "цу"', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('a9f4b2ce-c4b9-4fc9-9f72-957686c2741f', 'aa84a2ed-29d5-4001-8e85-9b334eb749b2', 'Кандзи - иероглифы в японском', '# Кандзи (漢字) в японском языке

Кандзи были заимствованы из китайского, но имеют:
- Несколько чтений (он-ёми и кун-ёми)
- Собственные значения

## Основные кандзи:
| Иероглиф | Значение | Он-ёми | Кун-ёми |
|----------|----------|--------|---------|
| 人       | человек  | ジン   | ひと    |
| 日       | солнце/день | ニチ  | ひ      |
| 月       | луна/месяц | ゲツ  | つき    |

**Совет:** Начинайте с простых кандзи, которые часто встречаются!', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('0c5d0711-505f-468a-9b68-33fe6855abc3', '39c44b39-4360-408d-bc31-35fb85b1ce7f', 'Английский алфавит', '# Английский алфавит

Английский алфавит состоит из 26 букв:

| Буква | Произношение |
|-------|--------------|
| A a   | [eɪ]         |
| B b   | [biː]        |
| C c   | [siː]        |
| ...   | ...          |
| Z z   | [zed] или [ziː] |

## Интересные факты:
- Самая часто используемая буква - **E**
- Самая редкая - **Z**
- Буква **Q** почти всегда идет в паре с **U**', '2025-07-12 02:33:27.398712');
INSERT INTO public.lessons VALUES ('ab23a476-1f97-4a87-b4bc-0ac324e6ef99', '39c44b39-4360-408d-bc31-35fb85b1ce7f', 'Фонетика и звуки', '# Английская фонетика

## Основные отличия от русского:
1. Наличие межзубных звуков: /θ/ (think) и /ð/ (this)
2. Дифтонги: /aɪ/ (like), /əʊ/ (go)
3. Долгота гласных имеет смыслоразличительное значение

### Минимальные пары:
- ship / sheep
- bad / bed
- cup / cap', '2025-07-12 02:33:27.398712');


--
-- TOC entry 3285 (class 2606 OID 16413)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 16403)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 16428)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 1259 OID 16419)
-- Name: idx_chapters_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_chapters_course_id ON public.chapters USING btree (course_id);


--
-- TOC entry 3289 (class 2606 OID 16414)
-- Name: chapters chapters_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 3290 (class 2606 OID 16429)
-- Name: lessons lessons_chapter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_chapter_id_fkey FOREIGN KEY (chapter_id) REFERENCES public.chapters(id);


-- Completed on 2026-05-03 19:42:03 MSK

--
-- PostgreSQL database dump complete
--

\unrestrict gTzpv8zJH6WID1WgiWoZ2JdKEmqeeu2SetRGGObpCPN1OOHZyOA9ViYU9nArVdZ

