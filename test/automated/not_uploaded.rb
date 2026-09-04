require_relative "automated_init"

context "Not uploaded" do
  control_file_uploaded = "some file"
  control_file_not_uploaded = "some other file"

  upload = Upload.new

  upload.(control_file_uploaded)

  comment "Control File Uploaded: #{control_file_uploaded.inspect}"
  comment "Control File Not Uploaded: #{control_file_not_uploaded.inspect}"

  context "The HTTP client doesn't post the file content" do
    posted = upload.http_client.posted?(control_file_not_uploaded)

    detail "Posted: #{posted.inspect}"

    test "Not posted" do
      refute(posted)
    end
  end
end
