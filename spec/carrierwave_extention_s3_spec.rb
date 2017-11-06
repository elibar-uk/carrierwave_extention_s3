require "spec_helper"

describe CarrierwaveExtentionS3 do
  it "has a version number" do
    expect(CarrierwaveExtentionS3::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
#
#test to rewrite in rspec and adjust to gem
# module CarrierWave
#   module Storage
#
#     class AWSEngine::FileTest < ActiveSupport::TestCase
#       context "when uploads file to AWS" do
#         setup do
#           @uploader = LogoUploader.new
#           @file = CarrierWave::Storage::AWSEngine::File.new(@uploader, nil, nil)
#           @uploading_file = CarrierWave::SanitizedFile.new(Rails.root.join('test/assets/home.png'))
#           @connection = Aws::S3::Client.new(stub_responses: true, region: 'eu-west-2')
#         end
#
#         should "create a valid key" do
#           @uploader.expects(:relative_path).returns('mobile/site/1000/home_logo/1325462760')
#
#           assert_equal "assets/public/mobile/site/1000/home_logo/1325462760/home.png", @file.key(@uploading_file)
#         end
#
#         should "call upload_file" do
#           @connection.stub_responses(:list_buckets, {
#             buckets: [ Aws::S3::Types::Bucket.new(name: Settings.bucket)]})
#           @file.expects(:s3_object).with(@uploading_file).returns(@connection)
#           @connection.expects(:upload_file).returns(true)
#
#           assert  @file.store(@uploading_file)
#         end
#
#         should "return the bucket name when bucket name is set" do
#           @file.expects(:bucket_name).returns("wld-assets-dev")
#
#           assert_equal "wld-assets-dev", @file.bucket_name
#         end
#
#         should "raise NoBucketSetError when bucket name is not set" do
#           Settings.expects(:bucket).returns(nil)
#
#           assert_raise CarrierWave::Storage::AWSEngine::NoBucketSetError do
#             @file.bucket_name
#           end
#         end
#       end
#     end
#   end
# end
