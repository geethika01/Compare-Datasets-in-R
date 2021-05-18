
compareReports <- function(report_original, report_QA, grouping_col, 
                           qa_step = "RTO Reports - non-misconduct candidates"){
  
  ctable <- compare_df(report_original, report_QA, 
                       group_col = c(grouping_col), stop_on_error=FALSE)
  match_result <- ctable$comparison_df
  
  if (nrow(match_result) == 0) {
    cat (paste("INFO: Comparison", qa_step, " - No mismatches"), sep="\n")
  } else {
    cat("WARNING: Comparison", qa_step, " - Check for mismatches")
    view_html(ctable)
  }
  
  return(match_result)
}