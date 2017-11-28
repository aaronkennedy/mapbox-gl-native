#include <mbgl/text/local_glyph_rasterizer.hpp>

namespace mbgl {

class LocalGlyphRasterizer::Impl {
};

LocalGlyphRasterizer::LocalGlyphRasterizer(void*)
{}

LocalGlyphRasterizer::~LocalGlyphRasterizer()
{}

bool LocalGlyphRasterizer::canRasterizeGlyph(const FontStack&, GlyphID) {
    return false;
}

Glyph LocalGlyphRasterizer::rasterizeGlyph(const FontStack&, GlyphID) {
    return Glyph();
}

} // namespace mbgl