ROOT_DIRECTORY = File.expand_path(File.dirname(__FILE__))

desc "Build the docker image"
task :build do
    sh "docker build --build-arg L4TBASE_VERSION='r32.4.3'"
end