# test_main.rb
require 'minitest/autorun'
require_relative 'Task1'

class TestCountFilesAndDirectories < Minitest::Test
  def setup
    # Створюємо тимчасову директорію для тестів
    @test_dir = 'test_dir'
    Dir.mkdir(@test_dir) unless Dir.exist?(@test_dir)

    # Додаємо файли та підпапки
    File.write(File.join(@test_dir, 'file1.txt'), 'test')
    File.write(File.join(@test_dir, 'file2.txt'), 'test')
    Dir.mkdir(File.join(@test_dir, 'subdir'))
    File.write(File.join(@test_dir, 'subdir', 'file3.txt'), 'test')
  end

  def teardown
    # Видаляємо тестову директорію після тестів
    FileUtils.rm_rf(@test_dir)
  end

  def test_count_files_and_directories
    result = count_files_and_directories(@test_dir)
    assert_equal 3, result[:files]         # Очікуємо 3 файли
    assert_equal 2, result[:directories]   # Очікуємо 2 директорії (test_dir і subdir)
  end

  def test_invalid_directory
    assert_raises(ArgumentError) do
      count_files_and_directories('invalid_dir')
    end
  end
end
