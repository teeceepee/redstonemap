MiniMagick.configure do |config|
  # 如果不能正常调用 ImageMagick 的命令，则使用指定的路径。
  begin
    # 返回命令 `identify -version` 输出，如果查找不到命令则会抛出异常。
    MiniMagick.cli_version
  rescue
    config.cli_path= '/root/.linuxbrew/bin'
  end
  config.cli_path= '/usr/local/bin'

end
