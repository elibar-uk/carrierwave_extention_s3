require "carrierwave_extention_s3/version"
require 'carrierwave'
require 'aws-sdk'

module CarrierwaveExtentionS3
  module Storage

    class AWSEngine < Abstract

      def store!(file)
        CarrierWave::Storage::AWSEngine::File.new(uploader, self, uploader.store_path(identifier)).tap do |f|
          f.store(file)
        end
      end

      def retrieve!(identifier)
        CarrierWave::Storage::AWSEngine::File.new(uploader, self, uploader.store_path(identifier))
      end

      class File

        attr_reader :path

        def initialize(uploader, path, base)
          @uploader = uploader
          @path = path
          @base = base
        end

        def store(file)
          s3_object(file).upload_file(file.path, content_type: 'image/png')
        end

        def connection
          @connection ||= Aws::S3::Resource.new
        end

        def key(file)
          "assets/public/#{@uploader.relative_path}/#{file.filename}"
        end

        def s3_object(file)
          s3_bucket.object(key(file))
        end

        def s3_bucket
          connection.bucket(bucket_name)
        end

        def bucket_name
          @bucket_name ||= begin
            raise NoBucketSetError unless Settings.bucket
            Settings.bucket
          rescue Settingslogic::MissingSetting
            raise NoBucketSetError
          end
        end
      end

      class NoBucketSetError < StandardError
      end

    end
  end
end
