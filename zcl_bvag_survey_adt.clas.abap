CLASS zcl_bvag_survey_adt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
*  CREATE PRIVATE .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CONSTANTS:
      BEGIN OF event_button,
        _1 TYPE char10 VALUE 'button_1',
        _2 TYPE char10 VALUE 'button_2',
        _3 TYPE char10 VALUE 'button_3',
        _4 TYPE char10 VALUE 'button_4',
      END OF event_button,
      BEGIN OF submit_button,
        _1 TYPE char30 VALUE 'Submit Question 1',
        _2 TYPE char30 VALUE 'Submit Question 2',
        _3 TYPE char30 VALUE 'Submit Question 3',
        _4 TYPE char30 VALUE 'Submit Question 4',
      END OF submit_button,
      BEGIN OF question_title,
        _1 TYPE char100 VALUE 'Have you started using the ADT?',
        _2 TYPE char100 VALUE 'What are the biggest challenges?',
        _3 TYPE char100 VALUE 'What is the main purpose for using it?',
        _4 TYPE char100 VALUE 'What additional resources your need?',
      END OF question_title,
      BEGIN OF answers_q1,
        _1 TYPE char100 VALUE 'Yes, I am actively using it.',
        _2 TYPE char100 VALUE 'Yes, I''ve tried it, but haven''t integrated it into my daily tasks yet.',
        _3 TYPE char100 VALUE 'No, and I don''t intend to use it currently.',
        _4 TYPE char100 VALUE 'Other.(Free Text)',
      END OF answers_q1,
      BEGIN OF answers_q2,
        _1 TYPE char100 VALUE 'Difficulty in understanding or navigating the tool.',
        _2 TYPE char100 VALUE 'Compatibility issues with current projects or systems.',
        _3 TYPE char100 VALUE 'Lack of necessary features or plugins.',
        _4 TYPE char100 VALUE 'Other.(Free Text)',
      END OF answers_q2,
      BEGIN OF answers_q3,
        _1 TYPE char100 VALUE 'Software development.',
        _2 TYPE char100 VALUE 'Debugging.',
        _3 TYPE char100 VALUE 'Testing.',
        _4 TYPE char100 VALUE 'Other (Free text).',
      END OF answers_q3,
      BEGIN OF answers_q4,
        _1 TYPE char100 VALUE 'Another demo session.',
        _2 TYPE char100 VALUE 'Video training sessions.',
        _3 TYPE char100 VALUE 'Comprehensive user scenario.',
        _4 TYPE char100 VALUE 'Other (Free text).',
      END OF answers_q4.


    CLASS-METHODS
      get_instance RETURNING VALUE(r_instance) TYPE REF TO zcl_bvag_survey_adt.

    METHODS:
      submit_answear IMPORTING i_question  TYPE i
                               i_answear   TYPE i
                               i_free_text TYPE char255.
    METHODS:
      display_result.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:
     survey_st TYPE zbvag_survey_adt.


    TYPES:
      BEGIN OF srv_alv_line,
        srv_question      TYPE integer,
        srv_question_text TYPE char100,
        answear           TYPE integer,
        answear_text      TYPE char100,
        free_text         TYPE char255,
        percent           TYPE char30,
      END OF srv_alv_line,
      ty_srv_tab TYPE STANDARD TABLE OF srv_alv_line WITH DEFAULT KEY.

    CONSTANTS:
      cons_srv_year TYPE syear VALUE 2025.

    METHODS load_srv_result
      RETURNING
        VALUE(r_srv_tab) TYPE ty_srv_tab.

    METHODS display_alv
      IMPORTING
        i_srv_tab TYPE ty_srv_tab.

    CLASS-DATA  singelton TYPE REF TO zcl_bvag_survey_adt.
    METHODS:
      encode_u RETURNING VALUE(r_string) TYPE char255,

      load_guid IMPORTING i_survey_s    TYPE survey_st
                RETURNING VALUE(r_guid) TYPE guid_32.

ENDCLASS.



CLASS zcl_bvag_survey_adt IMPLEMENTATION.

  METHOD get_instance.
    IF singelton IS NOT BOUND.

      singelton = NEW #(  ).

    ENDIF.

    r_instance = singelton.
  ENDMETHOD.

  METHOD submit_answear.

    DATA survey_st TYPE zbvag_survey_adt.

    GET TIME STAMP FIELD DATA(ts).

    survey_st-srv_question_text  = COND #( WHEN i_question = 1 THEN zcl_bvag_survey_adt=>question_title-_1
                                           WHEN i_question = 2 THEN zcl_bvag_survey_adt=>question_title-_2
                                           WHEN i_question = 3 THEN zcl_bvag_survey_adt=>question_title-_3
                                           WHEN i_question = 4 THEN zcl_bvag_survey_adt=>question_title-_4  ).

    survey_st-answear_text  = COND #( WHEN i_question = 1 AND i_answear = 1 THEN zcl_bvag_survey_adt=>answers_q1-_1
                                      WHEN i_question = 1 AND i_answear = 2 THEN zcl_bvag_survey_adt=>answers_q1-_2
                                      WHEN i_question = 1 AND i_answear = 3 THEN zcl_bvag_survey_adt=>answers_q1-_3
                                      WHEN i_question = 1 AND i_answear = 4 THEN zcl_bvag_survey_adt=>answers_q1-_4

                                      WHEN i_question = 2 AND i_answear = 1 THEN zcl_bvag_survey_adt=>answers_q2-_1
                                      WHEN i_question = 2 AND i_answear = 2 THEN zcl_bvag_survey_adt=>answers_q2-_2
                                      WHEN i_question = 2 AND i_answear = 3 THEN zcl_bvag_survey_adt=>answers_q2-_3
                                      WHEN i_question = 2 AND i_answear = 4 THEN zcl_bvag_survey_adt=>answers_q2-_4

                                      WHEN i_question = 3 AND i_answear = 1 THEN zcl_bvag_survey_adt=>answers_q3-_1
                                      WHEN i_question = 3 AND i_answear = 2 THEN zcl_bvag_survey_adt=>answers_q3-_2
                                      WHEN i_question = 3 AND i_answear = 3 THEN zcl_bvag_survey_adt=>answers_q3-_3
                                      WHEN i_question = 3 AND i_answear = 4 THEN zcl_bvag_survey_adt=>answers_q3-_4

                                      WHEN i_question = 4 AND i_answear = 1 THEN zcl_bvag_survey_adt=>answers_q4-_1
                                      WHEN i_question = 4 AND i_answear = 2 THEN zcl_bvag_survey_adt=>answers_q4-_2
                                      WHEN i_question = 4 AND i_answear = 3 THEN zcl_bvag_survey_adt=>answers_q4-_3
                                      WHEN i_question = 4 AND i_answear = 4 THEN zcl_bvag_survey_adt=>answers_q4-_4    ).

    survey_st-encode_u      = encode_u( ).
    survey_st-srv_question  = i_question.
    survey_st-answear       = i_answear.
    survey_st-free_text     = i_free_text.
    survey_st-srv_year      = sy-datum(4).
    survey_st-srv_date_time = ts.
    survey_st-guid_32       = load_guid( survey_st ).

    MODIFY zbvag_survey_adt FROM survey_st.

  ENDMETHOD.

  METHOD encode_u.

    TRY.

        "Step 1: Convert user into XSTRING format.
        DATA(xstring_input) = cl_bcs_convert=>string_to_xstring( CONV #( sy-uname ) ).

        "Step 2: Encrypt to XSTRING to BASE64
        cl_http_utility=>encode_x_base64( EXPORTING unencoded = xstring_input
                                          RECEIVING encoded   = r_string ).

      CATCH     cx_bcs.
        "Set random integer
        DATA(random_generator) = cl_abap_random=>create( seed = CONV #( sy-uzeit ) ).

        r_string = random_generator->int(  ).
    ENDTRY.
  ENDMETHOD.

  METHOD load_guid.

    SELECT SINGLE guid_32 FROM zbvag_survey_adt INTO @r_guid
      WHERE encode_u = @i_survey_s-encode_u
        AND srv_question = @i_survey_s-srv_question
        AND srv_year     = @i_survey_s-srv_year.

    IF r_guid IS INITIAL.

      CALL FUNCTION 'GUID_CREATE'
        IMPORTING
          ev_guid_32 = r_guid.

    ENDIF.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.

  METHOD display_result.

* ALV Result
*display_alv( load_srv_result( ) ).

    DATA question TYPE string.
    DATA answear TYPE string.
    DATA free_text TYPE string.
    DATA(result) = load_srv_result( ).
    DATA previous_line TYPE srv_alv_line.

    cl_demo_output=>write( 'Survey - June 2025' ).
    cl_demo_output=>line( ).

    LOOP AT  result ASSIGNING FIELD-SYMBOL(<question>) GROUP BY <question>-srv_question.

      question = |{ <question>-srv_question }. { <question>-srv_question_text }|.
      cl_demo_output=>write( question ).

      LOOP AT  result ASSIGNING FIELD-SYMBOL(<answear>) WHERE srv_question = <question>-srv_question .

        answear = |   [{ COND char4( WHEN <answear>-percent(4) = '0 %' THEN '0.00'
                                                                       ELSE  <answear>-percent(4) ) }%] { <answear>-answear_text }|.

        IF previous_line-answear = 4.

          previous_line = <answear>.

        ELSE.

          cl_demo_output=>write( answear ).

        ENDIF.

        previous_line = <answear>.

      ENDLOOP.

      CLEAR previous_line.

      LOOP AT  result ASSIGNING FIELD-SYMBOL(<free_text>) WHERE srv_question = <question>-srv_question
                                                            AND answear      = 4
                                                            AND free_text IS NOT INITIAL.

        free_text = | Free text ---/ { <answear>-free_text } /|.

        cl_demo_output=>write( free_text ).

      ENDLOOP.

      cl_demo_output=>line( ).

    ENDLOOP.

    cl_demo_output=>display(  ).

  ENDMETHOD.

  METHOD load_srv_result.

    DATA: srv_free_text_tab TYPE STANDARD TABLE OF srv_alv_line.

    r_srv_tab = VALUE #(
    "Q1
    ( srv_question = 1 srv_question_text = question_title-_1  answear = 1 answear_text = answers_q1-_1  )
    ( srv_question = 1 srv_question_text = question_title-_1  answear = 2 answear_text = answers_q1-_2  )
    ( srv_question = 1 srv_question_text = question_title-_1  answear = 3 answear_text = answers_q1-_3  )
    ( srv_question = 1 srv_question_text = question_title-_1  answear = 4 answear_text = answers_q1-_4  )

    "Q2
    ( srv_question = 2 srv_question_text = question_title-_2  answear = 1 answear_text = answers_q2-_1  )
    ( srv_question = 2 srv_question_text = question_title-_2  answear = 2 answear_text = answers_q2-_2  )
    ( srv_question = 2 srv_question_text = question_title-_2  answear = 3 answear_text = answers_q2-_3  )
    ( srv_question = 2 srv_question_text = question_title-_2  answear = 4 answear_text = answers_q2-_4  )

    "Q3
    ( srv_question = 3 srv_question_text = question_title-_3  answear = 1 answear_text = answers_q3-_1  )
    ( srv_question = 3 srv_question_text = question_title-_3  answear = 2 answear_text = answers_q3-_2  )
    ( srv_question = 3 srv_question_text = question_title-_3  answear = 3 answear_text = answers_q3-_3  )
    ( srv_question = 3 srv_question_text = question_title-_3  answear = 4 answear_text = answers_q3-_4  )

    "Q4
    ( srv_question = 4 srv_question_text = question_title-_4  answear = 1 answear_text = answers_q4-_1  )
    ( srv_question = 4 srv_question_text = question_title-_4  answear = 2 answear_text = answers_q4-_2  )
    ( srv_question = 4 srv_question_text = question_title-_4  answear = 3 answear_text = answers_q4-_3  )
    ( srv_question = 4 srv_question_text = question_title-_4  answear = 4 answear_text = answers_q4-_4  ) ).

    SELECT FROM zbvag_survey_adt AS srv
      FIELDS srv~srv_question
              ,srv~srv_question_text
              ,srv~answear
              ,srv~answear_text
              ,srv~free_text
      WHERE srv_year = @cons_srv_year
      GROUP BY srv~srv_question
              ,srv~srv_question_text
              ,srv~answear
              ,srv~answear_text
              ,srv~free_text
      ORDER BY srv~srv_question
    INTO TABLE @DATA(lt_answear_2025_q1).

    LOOP AT r_srv_tab ASSIGNING FIELD-SYMBOL(<srv_line>).

      "For calculation percent.
      DATA(count_question_x) = REDUCE numc3( INIT x = 0 FOR wa IN lt_answear_2025_q1
                                            WHERE ( srv_question = <srv_line>-srv_question )
                                             NEXT x = x + 1 ).

      "For calculation percent.
      DATA(count_answear_x) = REDUCE numc3( INIT x = 0 FOR wa IN lt_answear_2025_q1
                                            WHERE ( srv_question = <srv_line>-srv_question
                                                     AND answear = <srv_line>-answear )
                                            NEXT x = x + 1 ).
      "Calculatio percent
      <srv_line>-percent = |{ count_answear_x / count_question_x * 100 } % |.

      LOOP  AT lt_answear_2025_q1 ASSIGNING FIELD-SYMBOL(<srv_answear>)
       WHERE srv_question =  <srv_line>-srv_question
         AND answear      = <srv_line>-answear.

        IF <srv_answear>-free_text IS NOT INITIAL.

          IF  <srv_line>-free_text IS INITIAL.

            <srv_line>-free_text = <srv_answear>-free_text.

          ELSE.

            APPEND VALUE #( srv_question = <srv_answear>-srv_question
                            srv_question_text = <srv_answear>-srv_question_text
                            answear = <srv_answear>-answear
                            answear_text  = <srv_answear>-answear_text
                            free_text =   <srv_answear>-free_text
                            percent = <srv_line>-percent ) TO srv_free_text_tab.
          ENDIF.

        ENDIF.

      ENDLOOP.

    ENDLOOP.

    APPEND LINES OF srv_free_text_tab  TO r_srv_tab.

    SORT r_srv_tab BY srv_question answear.

    "SQL calculation result
*      SELECT  FROM zbvag_survey_adt AS srv
*        FIELDS srv~srv_question
*                ,srv~srv_question_text
*                ,srv~answear
*                ,srv~answear_text
*                ,srv~free_text
*                ,count_q1
**             ,COUNT( DISTINCT srv~srv_question = 1 ) as count_que_1
**COUNT(CASE WHEN list_price < 500 THEN product_id END) AS cheap_product_count
**COUNT(1) FILTER (WHERE POSITION = 'Manager') AS ManagerCount,
**             ,count( 1 ) FILTER ( where srv~srv_question = '1' ) as count_ans_1
*        WHERE srv_year = '2025'
*        GROUP BY srv~srv_question
*                ,srv~srv_question_text
*                ,srv~answear
*                ,srv~answear_text
*                ,srv~free_text
*        ORDER BY srv~srv_question
*      INTO TABLE @DATA(lt_srv_2025).
*

  ENDMETHOD.



  METHOD display_alv.

    DATA(srv_tab) =  i_srv_tab.

    TRY .

        DATA alv_obj TYPE REF TO cl_salv_table.

        cl_salv_table=>factory( IMPORTING r_salv_table = alv_obj
                                CHANGING  t_table      = srv_tab ).

        " set functions
        DATA(funcs) = alv_obj->get_functions( ).
        funcs->set_all( ).

        DATA(columns) = alv_obj->get_columns( ).
        columns->set_optimize( ).

        alv_obj->display( ).

      CATCH cx_salv_msg INTO DATA(ex).

        "Check table VSEOATTRIB for constants.
        MESSAGE ex TYPE if_xo_const_message=>error.

    ENDTRY.

  ENDMETHOD.



ENDCLASS.
