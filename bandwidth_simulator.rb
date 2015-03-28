require 'sinatra'
directory = File.realdirpath(ARGV[0])
# in bytes per second
bandwidth = ARGV[1].to_i
get '/*' do
    path = directory + "/" + params[:splat].join("/")
    return if not path.start_with? File.realpath(path) or File.directory?(path)
    content_type Rack::Mime::MIME_TYPES[File.extname(path).downcase]
    f = File.open(path)
    stream do |out|
        last = Time.now
        now = nil
        chunk_size = 1024
        while not (content = f.read(chunk_size)).nil?
            out << content
            now = Time.now
            to_sleep = chunk_size.to_f / bandwidth - (now - last)
            if to_sleep > 0
                sleep to_sleep
            end
            last = Time.now
        end
    end
end
