require_relative 'utilities'
include Utilities

class FileUploadPage < BasePage

  UPLOADED_FILE_PATH_FIELD ||= {:name => 'upload_file'}
  UPLOAD_BUTTON ||= {:css => "[value='Upload']"}
  FILE_UPLOADED_TEXT_MESSAGE ||= {:css => 'div>h2'}
  NO_FILE_UPLOADED_TEXT_MESSAGE ||= {:css => 'body>h1'}
  FILE_UPLOADED_TEXT ||= 'Gruyere: Upload Complete'
  NO_FILE_UPLOADED_TEXT ||= 'Gruyere System Alert'
  FILE_UPLOADED_LOCATION_MESSAGE ||= {:class => 'content'}
  FILE_UPLOADED_ERROR_TEXT ||= {:class => 'message'}
  NO_FILE_UPLOADED_ERROR_TEXT ||= {:tag_name => 'tt'}
  USING_WINDOWS ||= !!((RUBY_PLATFORM =~ /(win|w)(32|64)$/) || (RUBY_PLATFORM=~ /mswin|mingw/))

  def initialize(driver)

    super

    @driver = driver

    raise 'Upload page not ready' unless
        is_displayed?(UPLOADED_FILE_PATH_FIELD)

    $LOG.info("Page at #{@driver.current_url} opened.")

  end

  def upload_file(file_name)

    file_path = File.join(Dir.pwd, file_name)

    if(USING_WINDOWS)
      file_path = Utilities.reverse_file_separators(file_path)
    end

    enter_text(UPLOADED_FILE_PATH_FIELD, file_path)
    click_upload_button

  end

  def click_upload_button

    click_button(UPLOAD_BUTTON)

  end

  def get_file_location_message

    wait_for(5, 1) { get_text(FILE_UPLOADED_TEXT_MESSAGE).eql?(FILE_UPLOADED_TEXT) }
    file_upload_location = get_text(FILE_UPLOADED_LOCATION_MESSAGE)
    $LOG.info("File uploaded message: #{file_upload_location.sub(/!\W/, ' ')}")
    file_upload_location

  end

  def get_file_upload_error_message

    wait_for(5, 1) { get_text(FILE_UPLOADED_TEXT_MESSAGE).eql?(FILE_UPLOADED_TEXT) }
    file_upload_error = get_text(FILE_UPLOADED_ERROR_TEXT)
    $LOG.info("Error displayed after file upload error #{file_upload_error}")
    file_upload_error

  end

  def get_no_file_error_message

    wait_for(5, 1) { get_text(NO_FILE_UPLOADED_TEXT_MESSAGE).eql?(NO_FILE_UPLOADED_TEXT) }
    no_file_error = get_text(NO_FILE_UPLOADED_ERROR_TEXT)
    $LOG.info("Error displayed after no file error #{no_file_error}")
    no_file_error

  end


end
