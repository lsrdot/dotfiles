// ~/.config/hypr/shaders/scanline.frag
void main() {
    vec2 uv = gl_FragCoord.xy / resolution;
    float scanline = sin(uv.y * resolution.y * 3.1415 * 2.0) * 0.1 + 0.9;
    gl_FragColor = texture2D(image, uv) * vec4(scanline, scanline, scanline, 1.0);
}
