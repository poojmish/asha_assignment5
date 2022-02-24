view: session_level_data {
  sql_table_name: `assignment_asha.session_level_data`
    ;;

  dimension: avg_text_sentiment_score {
    type: number
    sql: ${TABLE}.avg_text_sentiment_score ;;
  }

  dimension: conversation_duration_seconds {
    type: number
    sql: ${TABLE}.Conversation_duration_seconds ;;
  }

  dimension: entry_intent {
    type: string
    sql: ${TABLE}.entryIntent ;;
  }

  dimension: exit_intent {
    type: string
    sql: ${TABLE}.exitIntent ;;
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

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionId ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
  measure: avg_sentiment_score {
    type: average
    sql: ${avg_text_sentiment_score} ;;
  }
  measure: sessions_count {
    type: count
    drill_fields: [session_id]
  }
  measure: avg_conversation_score {
    type: average
    sql: ${conversation_duration_seconds} ;;
  }
}
