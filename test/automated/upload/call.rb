require_relative "../automated_init"

context "Upload" do
  context "Call" do
    control_file = "some file"

    upload = Upload.new

    upload.(control_file)

    posted = upload.http_client.invoked?(:post, content: control_file)

    comment "Control File: #{control_file.inspect}"
    comment "Posted: #{posted.inspect}"

    test do
      assert(posted)
    end
  end
end
