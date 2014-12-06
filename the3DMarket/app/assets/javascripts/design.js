if ( ! Detector.webgl ) Detector.addGetWebGLMessage();

var camera, cameraTarget, controls, scene, renderer;

function init() {

  camera = new THREE.PerspectiveCamera( 30, 640 / 480, 1, 1000 );
  camera.position.set( 2, 1, 2 );

  controls = new THREE.TrackballControls( camera );

  controls.rotateSpeed = 5.0;
  controls.zoomSpeed = 5;
  //controls.panSpeed = 2;

  controls.noZoom = true;
  controls.noPan = true;

  controls.staticMoving = true;
  controls.dynamicDampingFactor = 1;

  cameraTarget = new THREE.Vector3( 0, 0.25, 0 );

  scene = new THREE.Scene();
  scene.fog = new THREE.Fog( 0xc8c8c8, 2, 5 );

  // Ground

  var plane = new THREE.Mesh( new THREE.PlaneGeometry( 8, 8 ), new THREE.MeshPhongMaterial( { ambient: 0x858585, color: 0x8c8c8c, specular: 0x000000 } ) );
  plane.rotation.x = -Math.PI/2;
  scene.add( plane );

  plane.receiveShadow = true;

  var gridHelper = new THREE.GridHelper( 4, 0.25 );
  gridHelper.setColors(0xFFFFFF,0xFFFFFF)		
  scene.add( gridHelper );

  // file

  var loader = new THREE.STLLoader();
  loader.addEventListener( 'load', function ( event ) {

	  var geometry = event.content;
	  var material = new THREE.MeshPhongMaterial( { ambient: 0x0a65b6, color: 0x0a65b6, specular: 0x0a65b6, shininess: 500 } );
	  var mesh = new THREE.Mesh( geometry, material );
	  var box = new THREE.Box3().setFromObject( mesh );
	  var a = new THREE.Vector3();
	  a = box.size();

	  mesh.position.set( 0, 0, 0 );
	  mesh.rotation.set( -Math.PI/2 , 0, 0);
	  if (a.x > 0)
	    mesh.scale.set( 1/(2*a.x), 1/(2*a.x), 1/(2*a.x) );
	  else
	    mesh.scale.set(0.01, 0.01, 0.01);
	  
	  mesh.castShadow = true;
	  mesh.receiveShadow = true;

	  scene.add( mesh );

  } );
  loader.load($('.stl-scene').attr("file_path"));

  // Lights

  scene.add( new THREE.AmbientLight( 0x666666 ) );

  addShadowedLight( 1, 1, 1, 0xffffff, 1 );
  addShadowedLight( 0, 1, -1, 0xffffff, 1 );
  addShadowedLight( 0, -1, 0, 0xffffff, 1.5 );

  // renderer

  renderer = new THREE.WebGLRenderer( { antialias: true } );
  renderer.setSize( 640, 480 );

  renderer.setClearColor( scene.fog.color, 1 );

  renderer.gammaInput = true;
  renderer.gammaOutput = true;

  renderer.shadowMapEnabled = true;
  renderer.shadowMapCullFace = THREE.CullFaceBack;

  $('.stl-scene').append( renderer.domElement );

}

function addShadowedLight( x, y, z, color, intensity ) {

  var directionalLight = new THREE.DirectionalLight( color, intensity );
  directionalLight.position.set( x, y, z )
  scene.add( directionalLight );

  directionalLight.castShadow = true;
  //directionalLight.shadowCameraVisible = true;

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
  directionalLight.shadowDarkness = 0.2;

}

function animate() {

  requestAnimationFrame( animate );
  controls.update();
  render();

}

function render() {

  //var timer = Date.now() * 0.0005;

  //camera.position.x = Math.cos( timer ) * 3;
  //camera.position.z = Math.sin( timer ) * 3;

  camera.lookAt( cameraTarget );

  renderer.render( scene, camera );

}
