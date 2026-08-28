require_relative "automated_init"

context "Upload" do
  control_file = "some file"

  upload = Upload.new

  upload.(control_file)

  comment "Control File: #{control_file.inspect}"

  context "Posted" do
    posted = upload.http_client.invoked?(:post, content: control_file)

    detail "Posted: #{posted.inspect}"

    test do
      assert(posted)
    end
  end
end
