// In-game CRT shader (Flat, Clean, No Static, No Bloom)
// Author: sarphiv (Modified for modular use)

// Settings (15% Softer Grid)
#define COLOR_FRINGING_SPREAD 0.1
#define GHOSTING_SPREAD 0.75
#define GHOSTING_STRENGTH 0.1
#define DARKEN_MIX 0.35              // Dropped slightly so it's not as "heavy"

#define SCAN_LINES_STRENGTH 0.17     // Was 0.20
#define SCAN_LINES_VARIANCE 0.30     // Was 0.35
#define SCAN_LINES_PERIOD 4.0

#define APERTURE_GRILLE_STRENGTH 0.25 // Was 0.3
#define APERTURE_GRILLE_PERIOD 2.0

#define BACKGROUND_OPACITY 0.8

// Fallbacks
#ifndef COLOR_FRINGING_SPREAD
#define COLOR_FRINGING_SPREAD 0.0
#endif
#ifndef TINT
#define TINT 1.00, 1.00, 1.00
#endif
#ifndef BACKGROUND_OPACITY
#define BACKGROUND_OPACITY 1.0
#endif

// Constants
#define PI 3.1415926535897932384626433832795

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Pixel Retrieval with Color Fringing (RGB Split)
    fragColor.r = texture(iChannel0, vec2(uv.x + 0.0003 * COLOR_FRINGING_SPREAD, uv.y + 0.0003 * COLOR_FRINGING_SPREAD)).x;
    fragColor.g = texture(iChannel0, vec2(uv.x + 0.0000 * COLOR_FRINGING_SPREAD, uv.y - 0.0006 * COLOR_FRINGING_SPREAD)).y;
    fragColor.b = texture(iChannel0, vec2(uv.x - 0.0006 * COLOR_FRINGING_SPREAD, uv.y + 0.0000 * COLOR_FRINGING_SPREAD)).z;
    fragColor.a = texture(iChannel0, uv).a;

    // Faint Ghosting logic
    fragColor.r += 0.04 * GHOSTING_STRENGTH * texture(iChannel0, GHOSTING_SPREAD * vec2(+0.025, -0.027) + uv.xy).x;
    fragColor.g += 0.02 * GHOSTING_STRENGTH * texture(iChannel0, GHOSTING_SPREAD * vec2(-0.022, -0.020) + uv.xy).y;
    fragColor.b += 0.04 * GHOSTING_STRENGTH * texture(iChannel0, GHOSTING_SPREAD * vec2(-0.020, -0.018) + uv.xy).z;

    // Darken and Tint
    fragColor.rgb = mix(fragColor.rgb, fragColor.rgb*fragColor.rgb, DARKEN_MIX);
    fragColor.rgb *= vec3(TINT);

    // Scan lines
    fragColor.rgb *= mix(
        1.0,
        SCAN_LINES_VARIANCE/2.0*(1.0 + sin(2*PI* uv.y * iResolution.y/SCAN_LINES_PERIOD)),
        SCAN_LINES_STRENGTH
    );

    // Aperture grille
    int apertureGrilleStep = int(8 * mod(fragCoord.x, APERTURE_GRILLE_PERIOD) / APERTURE_GRILLE_PERIOD);
    float apertureGrilleMask;
    if (apertureGrilleStep < 3) apertureGrilleMask = 0.0;
    else if (apertureGrilleStep < 4) apertureGrilleMask = mod(8*fragCoord.x, APERTURE_GRILLE_PERIOD) / APERTURE_GRILLE_PERIOD;
    else if (apertureGrilleStep < 7) apertureGrilleMask = 1.0;
    else if (apertureGrilleStep < 8) apertureGrilleMask = mod(-8*fragCoord.x, APERTURE_GRILLE_PERIOD) / APERTURE_GRILLE_PERIOD;

    fragColor.rgb *= 1.0 - APERTURE_GRILLE_STRENGTH*apertureGrilleMask;

    // Final color output
    fragColor = vec4(fragColor.rgb*fragColor.a, BACKGROUND_OPACITY);
}
