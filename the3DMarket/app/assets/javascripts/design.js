function init () {
  //Camera settings.                FOV vv  aspect ratio, camera frustum
  camera = new THREE.PerspectiveCamera(55, 640 / 480, 1, 15);
  camera.position.set(3, 0.15, 10);
  cameraTarget = new THREE.Vector3(0, -0.25, 0);
  scene = new THREE.Scene();
  scene.fog = new THREE.Fog(0xAAAAAA, 2, 15);
  // Ground
  //this sets up the ground layer.  We can replace this with a grid, but I still need to find out how.
  var plane = new THREE.Mesh(new THREE.PlaneGeometry(40, 40), new THREE.MeshPhongMaterial({
      ambient: 0x999999,
      color: 0x999999,
      specular: 0x101010
  }));
  plane.rotation.x = -Math.PI / 2;
  plane.position.y = -0.5;
  //scene.add(plane);
  // Add Shadows
  plane.receiveShadow = true;
  //stuff I don't understand.
  var loader = new THREE.STLLoader();
  loader.addEventListener('load', function(event) {
    var geometry = event.content;
    //set up STL material stuff
    //Add some attributes (color, etc)
    var material = new THREE.MeshPhongMaterial({
        ambient: 0x9999DD,
        color: 0x5555BB,
        specular: 0x111111,
        shininess: 10
    });
    //ambient is the diffraction lighting, color is fill color, specular is reflection shading, and shininess is amount of reflection
    var mesh = new THREE.Mesh(geometry, material);
    //this affects the position, size, and rotation of the STL model.  Changethese as you see fit to make the scene look good
    mesh.position.set(0, -0.25, 0);
    mesh.rotation.set(0, -Math.PI / 2, 0);
    mesh.scale.set(0.01, 0.01, 0.01);
    mesh.castShadow = true;
    mesh.receiveShadow = true;
    scene.add(mesh);
  });
  //load an STL file
  loader.load($('.stl-scene').attr("file_path"));
  // Binary files
  var material = new THREE.MeshPhongMaterial({
    ambient: 0x555555,
    color: 0xFF0000,
    specular: 0x00FF00,
    shininess: 200
  });
  var loader = new THREE.STLLoader();
  loader.addEventListener('load', function(event) {
    var geometry = event.content;
    var mesh = new THREE.Mesh(geometry, material);
    mesh.position.set(0, -0.37, -0.6);
    mesh.rotation.set(-Math.PI / 2, 0, 0);
    mesh.scale.set(2, 2, 2);
    mesh.castShadow = true;
    mesh.receiveShadow = true;
    scene.add(mesh);
  });
  // Lights
  //this defines the ambient lighting (think bright sky)
  scene.add(new THREE.AmbientLight(0x404040));
  //this adds a highlight/shadow, defined elsewhere
  addShadowedLight(1, 1, 1, 0xffffff, .5);
  // renderer
  //some render settings                always anti-alias
  renderer = new THREE.WebGLRenderer({
    antialias: true
  });
  renderer.setSize(500, 500);
  //this is where we set the size of the viewing pane
  renderer.setClearColor(scene.fog.color, 1);
  //dunno what these do
  renderer.gammaInput = true;
  renderer.gammaOutput = true;
  //pretty sure these shadow settings allow shadows to render
  renderer.shadowMapEnabled = true;
  renderer.shadowMapCullFace = THREE.CullFaceBack;
  $('.stl-scene').append(renderer.domElement);
  // stats  -- here's where we see the framerate counter.
  //Comment this section to disable that feature.
  /*
  stats = new Stats();
  stats.domElement.style.position = 'relative';
  stats.domElement.style.top = '0px';
  $('.stl-scene').append(stats.domElement);
  */
  //
  //window.addEventListener('resize', onWindowResize, false);
}
//this defines the shadowedlight function above.
function addShadowedLight(x, y, z, color, intensity) {
  var directionalLight = new THREE.DirectionalLight(color, intensity);
  directionalLight.position.set(x, y, z);
  scene.add(directionalLight);
  directionalLight.castShadow = true;
  // directionalLight.shadowCameraVisible = true;
  var d = 1;
  directionalLight.shadowCameraLeft = -d;
  directionalLight.shadowCameraRight = d;
  directionalLight.shadowCameraTop = d;
  directionalLight.shadowCameraBottom = -d;
  directionalLight.shadowCameraNear = 1;
  directionalLight.shadowCameraFar = 4;
  directionalLight.shadowMapWidth = 1024;
  directionalLight.shadowMapHeight = 1024;
  directionalLight.shadowBias = -0.005;
  directionalLight.shadowDarkness = 0.15;
}

function onWindowResize() {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(window.innerWidth, window.innerHeight);
}

function animate() {
  requestAnimationFrame(animate);
  render();
  stats.update();
}

function render() {
  //this handles rotation
  var timer = Date.now() * 0.0005;
  camera.position.x = Math.cos(timer) * 3;
  camera.position.z = Math.sin(timer) * 3;
  camera.lookAt(cameraTarget);
  renderer.render(scene, camera);
}
