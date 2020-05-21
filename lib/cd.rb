class Disk < Product
  def update(options)
    @album = options[:album]
    @artist = options[:artist]
    @genre = options[:genre]
  end

  def info
    "Disc #{@artist} - #{@album} (#{@genre})"
  end
end

