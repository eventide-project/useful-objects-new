require_relative "automated_init"

context "Upload" do
  control_file = "some file"

  upload = Upload.new

  upload.(control_file)

  comment "Control File: #{control_file.inspect}"

  context "Posts the file to the HTTP client" do
    posted = upload.http_client.posted?(control_file)

    detail "Posted: #{posted.inspect}"

    test "Posted" do
      assert(posted)
    end
  end
end
