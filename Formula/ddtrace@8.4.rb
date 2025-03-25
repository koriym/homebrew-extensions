class DdtraceAT84 < Formula
  desc "Datadog tracing and profiling PECL extension"
  url "https://pecl.php.net/get/datadog_trace-1.7.2.tgz"
  sha256 "db5661a1bc859f4fe0f4b8bc50012ac3655ba0d7d0b5380b1b92bc8caa9a54e9"
  license "Apache-2.0"

  depends_on "php@8.4"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "rust" => :build

  def install
    php_config = "#{Formula["php@8.4"].opt_bin}/php-config"
    Dir.chdir "datadog_trace-#{version}" do
      safe_phpize
      system "./configure", "--prefix=#{prefix}", "--with-php-config=#{php_config}"
      system "make"
      prefix.install "modules/ddtrace.so"
    end

    ext_config_path = etc/"php"/php_version/"conf.d"/"20-ddtrace.ini"
    ext_config_path.dirname.mkpath

    # 設定ファイルが存在しない場合のみ作成
    unless ext_config_path.exist?
      ext_config_path.write <<~EOS
        [ddtrace]
        extension=#{opt_prefix}/ddtrace.so
      EOS
    end
  end

  def safe_phpize
    ENV["PHP_AUTOCONF"] = "#{Formula["autoconf"].opt_bin}/autoconf"
    ENV["PHP_AUTOHEADER"] = "#{Formula["autoconf"].opt_bin}/autoheader"
    system "#{Formula["php@8.4"].opt_bin}/phpize"
  end

  def php_version
    version = Utils.safe_popen_read("#{Formula["php@8.4"].opt_bin}/php", "-v")
    match = version.match(/PHP ([0-9]+\.[0-9]+)/)
    match ? match[1] : "8.4"
  end
end
