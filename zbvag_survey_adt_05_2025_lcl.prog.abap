*&---------------------------------------------------------------------*
*& Include zbvag_survey_adt_05_2025_lcl
*&---------------------------------------------------------------------*


CLASS lcl_zbvag_survey_adt_05_2025 DEFINITION
  FINAL CREATE PRIVATE.

  PUBLIC SECTION.

    CLASS-DATA singelton TYPE REF TO lcl_zbvag_survey_adt_05_2025.

    CLASS-METHODS: class_constructor.

    METHODS constructor.
    METHODS displa_result.
    METHODS hide.
    METHODS event.

  PRIVATE SECTION.

    DATA bl TYPE REF TO zcl_bvag_survey_adt.


ENDCLASS.

CLASS lcl_zbvag_survey_adt_05_2025 IMPLEMENTATION.

  METHOD class_constructor.

    singelton = NEW #(  ).

  ENDMETHOD.

  METHOD constructor.

    bl = zcl_bvag_survey_adt=>get_instance(  ).

  ENDMETHOD.

  METHOD displa_result.

    "Display grafic
    bl->display_result( ).

  ENDMETHOD.

  METHOD event.

    CASE event.
      WHEN zcl_bvag_survey_adt=>event_button-_1.
        bl->submit_answear( i_question = 1
                            i_answear  = COND i( WHEN pq1_1 = abap_true THEN 1
                                                 WHEN pq1_2 = abap_true THEN 2
                                                 WHEN pq1_3 = abap_true THEN 3
                                                 WHEN pq1_4 = abap_true THEN 4  )
                            i_free_text = othr_1 ).

      WHEN zcl_bvag_survey_adt=>event_button-_2.
        bl->submit_answear( i_question = 2
                            i_answear  = COND i( WHEN pq2_1 = abap_true THEN 1
                                                 WHEN pq2_2 = abap_true THEN 2
                                                 WHEN pq2_3 = abap_true THEN 3
                                                 WHEN pq2_4 = abap_true THEN 4  )
                            i_free_text = othr_2 ).

      WHEN zcl_bvag_survey_adt=>event_button-_3.
        bl->submit_answear( i_question = 3
                            i_answear  = COND i( WHEN pq3_1 = abap_true THEN 1
                                                 WHEN pq3_2 = abap_true THEN 2
                                                 WHEN pq3_3 = abap_true THEN 3
                                                 WHEN pq3_4 = abap_true THEN 4  )
                            i_free_text = othr_3 ).

      WHEN zcl_bvag_survey_adt=>event_button-_4.
        bl->submit_answear( i_question = 4
                            i_answear  = COND i( WHEN pq4_1 = abap_true THEN 1
                                                 WHEN pq4_2 = abap_true THEN 2
                                                 WHEN pq4_3 = abap_true THEN 3
                                                 WHEN pq4_4 = abap_true THEN 4  )
                            i_free_text = othr_4 ).

    ENDCASE.

    CLEAR event.

  ENDMETHOD.

  METHOD hide.

    LOOP AT SCREEN.

      CASE screen-group1.
        WHEN 'Q1'.
          IF  pq1_4 = abap_true.
            screen-active = 1.
            MODIFY SCREEN.
          ELSE.
            screen-active = 0.
            MODIFY SCREEN.
          ENDIF.
        WHEN 'Q2'.
          IF  pq2_4 = abap_true.
            screen-active = 1.
            MODIFY SCREEN.
          ELSE.
            screen-active = 0.
            MODIFY SCREEN.
          ENDIF.
        WHEN 'Q3'.
          IF  pq3_4 = abap_true.
            screen-active = 1.
            MODIFY SCREEN.
          ELSE.
            screen-active = 0.
            MODIFY SCREEN.
          ENDIF.
        WHEN 'Q4'.
          IF  pq4_4 = abap_true.
            screen-active = 1.
            MODIFY SCREEN.
          ELSE.
            screen-active = 0.
            MODIFY SCREEN.
          ENDIF.
      ENDCASE.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
