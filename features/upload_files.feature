Feature: Ability to upload files

  Background:
    Given a valid user logs in

  @upload @valid
  Scenario Outline: Upload valid file types
    Given a user uploads the file "<file_name>"
    Then a file access url will be displayed

    Examples:
    |file_name                 |
    |upload_text_file_0kb.txt  |
    |upload_text_file_49kb.txt |
    |upload_text_file_50kb.txt |

  @upload @invalid
  Scenario Outline: Upload invalid file types
    Given a user uploads the file "<file_name>"
    Then the error message "<error>" will be displayed

    Examples:
      |file_name                 |error                                                                      |
      |upload_text_file_52kb.txt |Couldn't write file upload_text_file_52kb.txt: Uploads are limited to 50K. |

  @upload @invalid @no_file_path
  Scenario: No file path supplied
    Given a user does not select a file to upload
    Then the no file error message "Exception: 'unicode' object has no attribute 'filename'" will be displayed
