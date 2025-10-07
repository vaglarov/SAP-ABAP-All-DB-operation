*&---------------------------------------------------------------------*
*& Include zbvag_survey_adt_05_2025_pbo
*&---------------------------------------------------------------------*

INITIALIZATION.

  title_1 = zcl_bvag_survey_adt=>question_title-_1.
  title_2 = zcl_bvag_survey_adt=>question_title-_2.
  title_3 = zcl_bvag_survey_adt=>question_title-_3.
  title_4 = zcl_bvag_survey_adt=>question_title-_4.

  but1 = zcl_bvag_survey_adt=>submit_button-_1.
  but2 = zcl_bvag_survey_adt=>submit_button-_2.
  but3 = zcl_bvag_survey_adt=>submit_button-_3.
  but4 = zcl_bvag_survey_adt=>submit_button-_4.

  ans_q1_1 = zcl_bvag_survey_adt=>answers_q1-_1.
  ans_q1_2 = zcl_bvag_survey_adt=>answers_q1-_2.
  ans_q1_3 = zcl_bvag_survey_adt=>answers_q1-_3.
  ans_q1_4 = zcl_bvag_survey_adt=>answers_q1-_4.

  ans_q2_1 = zcl_bvag_survey_adt=>answers_q2-_1.
  ans_q2_2 = zcl_bvag_survey_adt=>answers_q2-_2.
  ans_q2_3 = zcl_bvag_survey_adt=>answers_q2-_3.
  ans_q2_4 = zcl_bvag_survey_adt=>answers_q2-_4.

  ans_q3_1 = zcl_bvag_survey_adt=>answers_q3-_1.
  ans_q3_2 = zcl_bvag_survey_adt=>answers_q3-_2.
  ans_q3_3 = zcl_bvag_survey_adt=>answers_q3-_3.
  ans_q3_4 = zcl_bvag_survey_adt=>answers_q3-_4.

  ans_q4_1 = zcl_bvag_survey_adt=>answers_q4-_1.
  ans_q4_2 = zcl_bvag_survey_adt=>answers_q4-_2.
  ans_q4_3 = zcl_bvag_survey_adt=>answers_q4-_3.
  ans_q4_4 = zcl_bvag_survey_adt=>answers_q4-_4.

AT SELECTION-SCREEN.

  CASE sscrfields-ucomm.
    WHEN 'USRC1'.
      event = zcl_bvag_survey_adt=>event_button-_1.
    WHEN 'USRC2'.
      event = zcl_bvag_survey_adt=>event_button-_2.

    WHEN 'USRC3'.
      event = zcl_bvag_survey_adt=>event_button-_3.

    WHEN 'USRC4'.
      event = zcl_bvag_survey_adt=>event_button-_4.

  ENDCASE.


AT SELECTION-SCREEN OUTPUT.

  lcl_zbvag_survey_adt_05_2025=>singelton->hide(  ).

  lcl_zbvag_survey_adt_05_2025=>singelton->event(  ).
