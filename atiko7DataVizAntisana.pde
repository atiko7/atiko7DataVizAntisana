import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;

PFont f1;
ArrayList <Location> locations = new ArrayList <Location>();

UnfoldingMap map;
JSONObject json;

void setup() {
  size(displayWidth, displayHeight, P2D);
  f1 = loadFont("AlegreyaSansSC-Bold-48.vlw");
  textFont(f1);
  noStroke();
  String tilesStr = sketchPath("data/tiles.mbtiles");

  map = new UnfoldingMap(this, new MBTilesMapProvider(tilesStr));
  map.zoomToLevel(10);
  map.panTo(new Location(-0.4f, -78.1f));
  MapUtils.createDefaultEventDispatcher(this, map);
  loadData();
  for (int i=0; i<locations.size (); i++) {
    SimplePointMarker marker = new SimplePointMarker(locations.get(i));
    marker.setColor(color(255, 255, 255, 0));
    marker.setStrokeColor(color(#23FF88, 230));
    marker.setStrokeWeight(2);
    map.addMarker(marker);
  }
  map.setTweening(true);

  println(locations.size());
}

void draw() {
  background(0);

  float s = map.getZoomLevel();

  map.draw();
  noFill();
  stroke(100, 100, 100);
  strokeWeight(5);
  ellipse(mouseX, mouseY, 100, 100);
  noStroke();
  fill(100, 100, 100);
  rect(0, 0, width, 0.1*height);
  fill(color(#76E2E8));
  textAlign(LEFT, TOP);
  textSize(42);
  text("ANTISANA", 0.02*width, 0.03*height);
  fill(color(#76E2E8));
  textAlign(LEFT, TOP);
  fill(255);
  textSize(30);
  text("visualización de datos" + s, 0.02*width, 0.05*height);
}

