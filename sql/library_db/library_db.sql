PGDMP  +                     }         
   library_db    17.4    17.4     0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            3           1262    16669 
   library_db    DATABASE     p   CREATE DATABASE library_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE library_db;
                     postgres    false                        3079    16670    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                        false            4           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                             false    2            �            1259    16707    books    TABLE     �  CREATE TABLE public.books (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    published_year integer NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    isbn character varying(13) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.books;
       public         heap r       postgres    false            �            1259    16732 
   borrowings    TABLE     �  CREATE TABLE public.borrowings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    book_id uuid,
    member_id uuid,
    borrow_date date NOT NULL,
    return_date date,
    status character varying(10) DEFAULT 'BORROWED'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.borrowings;
       public         heap r       postgres    false            �            1259    16720    members    TABLE     v  CREATE TABLE public.members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(15) NOT NULL,
    address text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.members;
       public         heap r       postgres    false            +          0    16707    books 
   TABLE DATA           g   COPY public.books (id, title, author, published_year, stock, isbn, created_at, updated_at) FROM stdin;
    public               postgres    false    218   �       -          0    16732 
   borrowings 
   TABLE DATA           v   COPY public.borrowings (id, book_id, member_id, borrow_date, return_date, status, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �       ,          0    16720    members 
   TABLE DATA           Z   COPY public.members (id, name, email, phone, address, created_at, updated_at) FROM stdin;
    public               postgres    false    219   #       �           2606    16719    books books_isbn_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);
 >   ALTER TABLE ONLY public.books DROP CONSTRAINT books_isbn_key;
       public                 postgres    false    218            �           2606    16717    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public                 postgres    false    218            �           2606    16740    borrowings borrowings_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_pkey;
       public                 postgres    false    220            �           2606    16731    members members_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.members DROP CONSTRAINT members_email_key;
       public                 postgres    false    219            �           2606    16729    members members_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public                 postgres    false    219            �           2606    16741 "   borrowings borrowings_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);
 L   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_book_id_fkey;
       public               postgres    false    218    4753    220            �           2606    16746 $   borrowings borrowings_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);
 N   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_member_id_fkey;
       public               postgres    false    4757    219    220            +     x����nGE׭��]VM����,�l�$!��l�Q-N4�q�����d�E��?��!a/Ɛ ������:�)�!(�">h�kv�H�8�kr	c{ ��=A��[:M��\a��ɥa\1���ʟ�1Nx���I.r6�q	�(D-L+Yc�Iik���y���:���g �6z�nx��PF�@)a����P�@*E[Vc�L��PNf��6�P�`��S�&��;���$Q����h�GW����w52�yf���2N�J���u!����n�=��8�m|��\G���NK�V�D����μ��I�	8/^��r��>t����}?"��q6�'fA��.�ke�<�α\�c:㷒���EM��d�r�MS���6@Άi���6�0��?�?~��=ώV�/l�X.$�i%�
�sS�'b���,q-��[.*+5y��_@���ul}!g}�;z����L��qh�ro0�zm�����e)E�tB͢���QC!$wPjl���.L����6���
o5
�v|�)'��Уɗh1E2���Ul�ތӄ��CY��Ɩ�A�iG�q�;���ގOs	 b����Qzu� \�E%Chv�X�B3���y��m���v�zoc�H�7wzO�n��u=��)ֺ�P�l��4)0ϑ�5>�Z�;���~(
}�-Xwc�M{,�˘Z=��-�7�7_�n��3bZwl��r^a�WbV��+^� �(�/��3:o�/Q�C{���F��#w��q@���Y����G�i�T��J ����F`[h�H�3���.r��g�c!�c�3}��c���3��֠�;��k�I`�I�
��E�{i��Xŕ�9@^w��Q�F^oc���w;���苡�	�*,���
� �\�*�&,9��]d�S���sٵ�>u�v	�E��@��4�#��:x���ݸ��M-<'ho�VW�"W  2�D�̛ql��Afe���H�T�&�G������x`9XH9㵔�NGb-�j@�lE�Ru�X)��享0���#���a&�gql�y�H��Z�!����*��?��gfYVk��R��޻l'LִK��%��2�(}�M�1qnKs�rx�r��Zx�S.O�?�j��N��Nۂݘ9�0^"I���+$���}O�r���e��V���p0�5y�]�����!�P�Z��q�K�ݍ�\�L��yX����L��c�*�l	�0�K��{�����i^w^��.Z`�CS;��t�s^���999�JX�N      -   m  x��WK�$�\W�B�C��d��!m%``�m�I������^�����Q��
FFF��]�S�C�X���8Q��m���9�Uqkۊ.�b^O)���xW�d�8{s9�^Lz�^�U����۲KH�0��e\�~��?�������ZH�O"�����(��=�s�S|�.�<KH[e��F�,���2��2�́;˩�8]|v�SԁE-��X�Ʃ���	\�_*������]	��&�2l���i�f[��=ת�P�	P �\L�!S�Ջg������b�v���i�����=���_������o����J��`9`��Vl�!ޢ΋vν��3����.(R���
���A�>���ia�h-K[�h����_�\��0ڀʸט�k�^�ff��G@ ��
��<3��eASMt��sAAy�٨:�`����c����=���ƥ�@�;��p�wwv��SsxZ�'nA�n�Q��5  :��ƣ�j�Q��E-?���N�/��O����q�Д��2A{��ż��u�	.�1X�«&����\�g]��ۧ��&�?9Nې��&l��������Q��`W���v��%͕&zC�/�ET���6�(�P��k��M�J���e��Eǀ�Țnhl��_M�;��.���QK͉=P��l�8�L:4N\��\Ƹ;ok�p(C`�<��#c:z��OE�W�01[�;�@�	���9^I놴ok���ŋ����>`�t9�xCI%Z��*��d�;L�κ�3�G���ؠ���m��9,��^��o�0����v�K���;C �]�L�PЉ��a(M�c,�T
\u�k�ݍ��ΉF�CK_���c�i��_��}�g_P:�2��V������Ju��^��z����?��]�t��� v����zY��e�u��Æh#������%���~@.��6<2×G�<bM`�z]�wċ	�mE��]�/��N��Z"M`~��c�a����z�\�L���>�K�G�w�踆ބ���Xm#�OW�E��c�^�v�Ϡ�Lq��U�y1�ZP�U���Amz1�����/@���eo�h�CPP�2�d(Z�3�=��	���X���+��MI����@�������EVb
�i)J ?�]_��}��7�֢(����	�U�Lm�ݼB��w"�u?y�.#ZRG�hm�U�_�u�
Q�` �4�h:w>��/������@6n�R�|Ծ�V��Y"�p���XS�ꖲ�]�;�o�$VL�������:����o����bd"- .-�P���;DrnX'�9�Ͱ挠��W@�Y������|���4��4�{~�|�j���Q `�y��@�{��1n�uL	���m)�ִ��:�B��p���C��{�tF�1F�s��	�������S���K'��ã*�x�c�}c�l�%E�Q�����f�
����u�$E�!7��0lM���p���5�rBr�g��/���O�]��� �x��Ea�r1$��IL������g�F�?x�8H]w�(S��\��XQxQK99�+�]�AZw�{��D��
��	 ��Bn�DE,FB��ǰH�;N 8w9#�S;��v�=ħ�;����������g      ,      x��W�n�6}���
�_���S�H�Ԉ�(�2�yek%C�v�~}�rR��6@�/G���9g���U�,AL{�x���BV',� ɛi;��S!����T~(;�.M;½�J�|����#�>�����H.㊉@�ܨ���u�͙�9Ԍp�cZ�����%c���M������]ؒ[\v��\�%��pG��+�q�<��K�\l5��`��b�"tZ�D"�X�m)�O#����]G&	^�U���!����� 7�$pއ(�y�@#8�=EkE
�����'�	w�a�';�����QR���Rʋi�n��e-ڐ�M�x�L�Y��2Q���dSs"����2Ћ�g�uq�&�h������+����>N�x.:� R��Z[�M��1k�5̰���ߓ}[wy�!�;zY2�����Y��V����%[�MM�s�
 �|2�`W�����n[p�����E?��3�p8�Մ`u���c�ǔ���(R̎�ȏ�~x��i�fRZ�֑9"�����C*K�]��c?���E�UvQ�*ed�}բ�V
�ۆ�������-q�����D�@��ۅ��<��i>��Eze!����" �k�rD�d���~��v����>��@Pv�'Ƈ�ļ}(7�t��kDJ���Pr�@+̈́�V8��x$�,�n>�#�kA�[��9�F��-&�i���\�$`H�����yT�%�^G�����P=ySƱ�e���=����� �*z(n~���zPfE4��qP̧�pnA�Q�Z�'���i��dз����nX�&�0�^H��v]6�I�Bv9i�Y�(��g��*H�q>He9�ʒ���� ��%��:4��m��aa�T�'��Gd��F"hU��բ��duE��=΄�+!M[|��4����#�M�Ho�\)�-s"#&�i�]5Տg��6�ʀ#�'�S��jqw���,��-ܕ��/�:	�,�-Ny��8����!yE6�m.�)ڑ~1"��ݼΒ`�5���_(�ST�w�X̢�3�D���������?= �<�7X��/���t�E/�i���i�p�H�sg�vH��.hJ��<Ut��r��?�0��m�n�drO�����y���8pË�L���"�wh��,�K4$Qr�Ov�/�xC�e�ݭCD(C�&��K�,�]�.F�WRbY�e`�g���!H+ʳ1_͖/��?a�^��#toh.S�l0��Rr��F��T�A���Y�_�8�Y�ڠ�h��q�$��E����m��(��z��j�ax��5�b�{�=��RŴ�u���|��׃��דȷ�)���<k@;��\a������)�#R�����c�'�0��C���]��Þ.T��ᰅm3�������5F0��M�����oʌ�o�	� ���c�6�;��"�ٴ7M���.,�P�	'��E;��ʌ�a�܎��ߢ��G�����:�����B5��)�X|@&2CM���M��L0�����`��e7Zt�bۚ�:��;;;�H�{     