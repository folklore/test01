module WaitForAjax
  def wait_for_ajax_completion
    # page.document so it keeps working inside "within" blocks.
    loop until page.document.has_selector?("body.ajax-completed")
  end
end