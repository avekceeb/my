
// https://stackoverflow.com/questions/46834998/scripted-jenkinsfile-parallel-stage

def runParallel = true
def buildStages

//node('master') {
node {
  stage('Initialise') {
    // Set up List<Map<String,Closure>> describing the builds
    buildStages = prepareBuildStages()
    println("Initialised pipeline.")
  }

  for (builds in buildStages) {
    if (runParallel) {
      parallel(builds)
    } else {
      // run serially (nb. Map is unordered! )
      for (build in builds.values()) {
        build.call()
      }
    }
  }

  stage('Finish') {
      println('Build complete.')
  }
}

// Create List of build stages to suit
def prepareBuildStages() {
  def buildStagesList = []

  for (i=1; i<5; i++) {
    def buildParallelMap = [:]
    for (name in [ 'one', 'two', 'three' ] ) {
      def n = "${name} ${i}"
      buildParallelMap.put(n, prepareOneBuildStage(n))
    }
    buildStagesList.add(buildParallelMap)
  }
  return buildStagesList
}

def prepareOneBuildStage(String name) {
  return {
    stage("Build stage:${name}") {
      println("Building ${name}")
      sh(script:'sleep 5', returnStatus:true)
    }
  }
}
