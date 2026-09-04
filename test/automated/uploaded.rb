require_relative "automated_init"

context "Uploaded" do
  control_file = "some file"

  upload = Upload.new

  upload.(control_file)

  comment "Control File: #{control_file.inspect}"

  context "The HTTP client posts the file content" do
    posted = upload.http_client.posted?(control_file)

    detail "Posted: #{posted.inspect}"

    test "Posted" do
      assert(posted)
    end
  end
end
