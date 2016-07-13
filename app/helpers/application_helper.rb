module ApplicationHelper

  $post_para_display = ["ID", "Platform", "Priority", "Category", "Content", "Status", "Created_at", "Comment", "Reporter", "Url" ,"Summary", "Edit"]
  $post_para_database = ["ID", "explorer", "Priority", "category", "content", "status", "created_at", "comment", "Reporter", "url" ,"summary"]
  $post_para_china = ["ID", "使用平台", "優先性", "分類", "描述", "狀態", "創建日期", "備註", "提報人", "網址或軟體版本" ,"概述"]
  $post_status = ["open","fix","verify","close","suggest"]

end


=begin
  $post_para_display = ["ID", "Platform", "Priority", "Category", "Content", "Status", "Created_at", "Comment", "Reporter", "Url" ,"Summary", "Edit"]
  $post_para_database = ["ID", "explorer", "Priority", "category", "content", "status", "created_at", "comment", "Reporter", "url" ,"summary"]
  $post_para_china = ["ID", "使用平台", "優先性", "分類", "描述", "狀態", "創建日期", "備註", "提報人", "網址或軟體版本" ,"概述"]
=end

#content: "APP首頁 北台灣可正常顯示，中台灣， 南台灣會被蓋版。", group_id: 1, created_at: "2016-07-07 03:47:44", updated_at: "2016-07-07 03:47:44", user_id: 1, explorer: "Android", url: "Android", category: "APP首頁", attach_link: nil, status: "open", comment: "", verify_date: nil, check_result: nil, summary: "APP顯示蓋版", reporter: "Sam", priority: 2


