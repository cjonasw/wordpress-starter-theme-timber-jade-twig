module.exports = (grunt) ->

  sourceThemeFolder = 'source'
  compiledThemeFolder = 'compiled'
  catchAllFiles = ['**/*.*', '!**/*.twade', '!**/*.styl',]

  grunt.initConfig

    stylus:

      development:
        files: [ {
          expand: true
          cwd: sourceThemeFolder
          src: '**/*.styl'
          dest: compiledThemeFolder
          ext: '.css'
        } ]

    jade:

      development:
        files: [ {
          expand: true
          cwd: sourceThemeFolder
          src: '**/*.twade'
          dest: compiledThemeFolder
          ext: '.twig'
        } ]

    copy:

      catchAllFiles:
        files: [
          cwd: sourceThemeFolder
          src: catchAllFiles
          dest: compiledThemeFolder
          expand: true
        ]

    watch:

      options:
        livereload: true

      stylus:
        files: [
          '**/*.styl'
        ]
        tasks: [
          'stylus'
        ]

      jade:
        files: [
          '**/*.twade'
        ]
        tasks: [
          'newer:jade'
        ]

      catchAllFiles:
        files: catchAllFiles
        tasks: [
          'newer:copy'
        ]

  grunt.registerTask 'compile', [
    'stylus'
    'jade'
  ]

  grunt.registerTask 'dev', [
    'compile'
    'copy'
    'watch'
  ]

  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-newer'
