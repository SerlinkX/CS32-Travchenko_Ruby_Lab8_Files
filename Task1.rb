# main.rb
require 'find'

def count_files_and_directories(path)
  file_count = 0
  dir_count = 0

  # Перевіряємо, чи існує вказаний шлях
  unless Dir.exist?(path)
    raise ArgumentError, "Директорія '#{path}' не знайдена."
  end

  # Проходимо рекурсивно по всіх файлах і папках
  Find.find(path) do |item|
    if File.directory?(item)
      dir_count += 1
    elsif File.file?(item)
      file_count += 1
    end
  end

  { files: file_count, directories: dir_count }
end
