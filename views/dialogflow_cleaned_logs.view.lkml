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

  dimension: platform_refined {
    type: string
    sql: if(${TABLE}.platform is null or ${TABLE}.platform ='', 'NA', ${TABLE}.platform);;
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

  dimension: numeric_sentiment_score_dim {
    type: number
    sql: CAST(${TABLE}.text_sentiment_score as FLOAT64);;
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
    sql: ${session_id} ;;
  }
  measure: total_queries {
    type: count_distinct
    sql: ${query_text} ;;
  }
  measure: avg_sentiment_score {
    type: average
    sql: ${numeric_sentiment_score_dim} ;;
  }
  measure: sessions_count {
    type: count
    drill_fields: [session_id]
  }
}
