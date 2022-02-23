view: dialogflow_cleaned_logs {
  sql_table_name: `assignment_asha.dialogflow_cleaned_logs`
    ;;

  dimension: display_name {
    type: string
    sql: ${TABLE}.displayName ;;
  }

  dimension: is_fallback {
    type: string
    sql: ${TABLE}.isFallback ;;
  }

  dimension: language_code {
    type: string
    sql: ${TABLE}.languageCode ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.queryText ;;
  }

  dimension_group: receive_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: response_id {
    type: string
    sql: ${TABLE}.response_Id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionId ;;
  }

  dimension: text_sentiment_score {
    type: string
    sql: ${TABLE}.text_sentiment_score ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: total_sessions {
    type: count_distinct
    sql: $[session_id] ;;


  }
}
