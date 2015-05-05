module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-shell')
  
  grunt.initConfig
    shell:
      convert:
        command: (name, height) ->
          command = ""
          for scale, suffix of {1: "", 2: "@2x", 3: "@3x"}
            command += "convert -resize x" + height * scale + " " + name + ".psd[0] " + "../Images.xcassets/" + name + ".imageset/" + name + suffix + ".png\n"   
          command
    
  grunt.registerTask "default", [
    "shell:convert:blockchain_logo:13"
  ]