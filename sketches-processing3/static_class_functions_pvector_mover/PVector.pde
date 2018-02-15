static class PVector2D {
 float x, y;
 PVector2D(float _x, _y) {
   x = _x;
   y = _y;
 }
 static add(PVector2D v1, PVector2D v2) {
   x = v1.x + v2.x;
   y = v1.y + v2.y;
   PVector2D v3 = new PVector(x,y);
   return v3;
}