const std = @import("std");
const wren = @cImport({
   @cInclude("wren.h");
   @cInclude("stdio.h");
});
const r = @cImport({
   @cInclude("raylib.h");
   @cInclude("raymath.h");
   @cInclude("rlgl.h");
});

pub const RaylibBindings = @This();


pub const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;
pub const ForeignMethodBindings = std.StaticStringMap(?*const WrenForeignMethodFn).initComptime(.{
.{ "raylib.Raylib.initAudioDevice()", wren_raylib_init_audio_device},
.{ "raylib.Raylib.closeAudioDevice()", wren_raylib_close_audio_device},
.{ "raylib.Raylib.isAudioDeviceReady()", wren_raylib_is_audio_device_ready},
.{ "raylib.Raylib.setMasterVolume(_)", wren_raylib_set_master_volume},
.{ "raylib.Raylib.getMasterVolume()", wren_raylib_get_master_volume},
.{ "raylib.Raylib.loadWave(_)", wren_raylib_load_wave},
.{ "raylib.Raylib.loadWaveFromMemory(_,_,_)", wren_raylib_load_wave_from_memory},
.{ "raylib.Raylib.isWaveValid(_)", wren_raylib_is_wave_valid},
.{ "raylib.Raylib.loadSound(_)", wren_raylib_load_sound},
.{ "raylib.Raylib.loadSoundFromWave(_)", wren_raylib_load_sound_from_wave},
.{ "raylib.Raylib.loadSoundAlias(_)", wren_raylib_load_sound_alias},
.{ "raylib.Raylib.isSoundValid(_)", wren_raylib_is_sound_valid},
.{ "raylib.Raylib.updateSound(_,_,_)", wren_raylib_update_sound},
.{ "raylib.Raylib.unloadWave(_)", wren_raylib_unload_wave},
.{ "raylib.Raylib.unloadSound(_)", wren_raylib_unload_sound},
.{ "raylib.Raylib.unloadSoundAlias(_)", wren_raylib_unload_sound_alias},
.{ "raylib.Raylib.exportWave(_,_)", wren_raylib_export_wave},
.{ "raylib.Raylib.exportWaveAsCode(_,_)", wren_raylib_export_wave_as_code},
.{ "raylib.Raylib.playSound(_)", wren_raylib_play_sound},
.{ "raylib.Raylib.stopSound(_)", wren_raylib_stop_sound},
.{ "raylib.Raylib.pauseSound(_)", wren_raylib_pause_sound},
.{ "raylib.Raylib.resumeSound(_)", wren_raylib_resume_sound},
.{ "raylib.Raylib.isSoundPlaying(_)", wren_raylib_is_sound_playing},
.{ "raylib.Raylib.setSoundVolume(_,_)", wren_raylib_set_sound_volume},
.{ "raylib.Raylib.setSoundPitch(_,_)", wren_raylib_set_sound_pitch},
.{ "raylib.Raylib.setSoundPan(_,_)", wren_raylib_set_sound_pan},
.{ "raylib.Raylib.waveCopy(_)", wren_raylib_wave_copy},
.{ "raylib.Raylib.waveCrop(_,_,_)", wren_raylib_wave_crop},
.{ "raylib.Raylib.waveFormat(_,_,_,_)", wren_raylib_wave_format},
.{ "raylib.Raylib.loadWaveSamples(_)", wren_raylib_load_wave_samples},
.{ "raylib.Raylib.unloadWaveSamples(_)", wren_raylib_unload_wave_samples},
.{ "raylib.Raylib.loadMusicStream(_)", wren_raylib_load_music_stream},
.{ "raylib.Raylib.loadMusicStreamFromMemory(_,_,_)", wren_raylib_load_music_stream_from_memory},
.{ "raylib.Raylib.isMusicValid(_)", wren_raylib_is_music_valid},
.{ "raylib.Raylib.unloadMusicStream(_)", wren_raylib_unload_music_stream},
.{ "raylib.Raylib.playMusicStream(_)", wren_raylib_play_music_stream},
.{ "raylib.Raylib.isMusicStreamPlaying(_)", wren_raylib_is_music_stream_playing},
.{ "raylib.Raylib.updateMusicStream(_)", wren_raylib_update_music_stream},
.{ "raylib.Raylib.stopMusicStream(_)", wren_raylib_stop_music_stream},
.{ "raylib.Raylib.pauseMusicStream(_)", wren_raylib_pause_music_stream},
.{ "raylib.Raylib.resumeMusicStream(_)", wren_raylib_resume_music_stream},
.{ "raylib.Raylib.seekMusicStream(_,_)", wren_raylib_seek_music_stream},
.{ "raylib.Raylib.setMusicVolume(_,_)", wren_raylib_set_music_volume},
.{ "raylib.Raylib.setMusicPitch(_,_)", wren_raylib_set_music_pitch},
.{ "raylib.Raylib.setMusicPan(_,_)", wren_raylib_set_music_pan},
.{ "raylib.Raylib.getMusicTimeLength(_)", wren_raylib_get_music_time_length},
.{ "raylib.Raylib.getMusicTimePlayed(_)", wren_raylib_get_music_time_played},
.{ "raylib.Raylib.loadAudioStream(_,_,_)", wren_raylib_load_audio_stream},
.{ "raylib.Raylib.isAudioStreamValid(_)", wren_raylib_is_audio_stream_valid},
.{ "raylib.Raylib.unloadAudioStream(_)", wren_raylib_unload_audio_stream},
.{ "raylib.Raylib.updateAudioStream(_,_,_)", wren_raylib_update_audio_stream},
.{ "raylib.Raylib.isAudioStreamProcessed(_)", wren_raylib_is_audio_stream_processed},
.{ "raylib.Raylib.playAudioStream(_)", wren_raylib_play_audio_stream},
.{ "raylib.Raylib.pauseAudioStream(_)", wren_raylib_pause_audio_stream},
.{ "raylib.Raylib.resumeAudioStream(_)", wren_raylib_resume_audio_stream},
.{ "raylib.Raylib.isAudioStreamPlaying(_)", wren_raylib_is_audio_stream_playing},
.{ "raylib.Raylib.stopAudioStream(_)", wren_raylib_stop_audio_stream},
.{ "raylib.Raylib.setAudioStreamVolume(_,_)", wren_raylib_set_audio_stream_volume},
.{ "raylib.Raylib.setAudioStreamPitch(_,_)", wren_raylib_set_audio_stream_pitch},
.{ "raylib.Raylib.setAudioStreamPan(_,_)", wren_raylib_set_audio_stream_pan},
.{ "raylib.Raylib.setAudioStreamBufferSizeDefault(_)", wren_raylib_set_audio_stream_buffer_size_default},
.{ "raylib.Raylib.setAudioStreamCallback(_,_)", wren_raylib_set_audio_stream_callback},
.{ "raylib.Raylib.attachAudioStreamProcessor(_,_)", wren_raylib_attach_audio_stream_processor},
.{ "raylib.Raylib.detachAudioStreamProcessor(_,_)", wren_raylib_detach_audio_stream_processor},
.{ "raylib.Raylib.attachAudioMixedProcessor(_)", wren_raylib_attach_audio_mixed_processor},
.{ "raylib.Raylib.detachAudioMixedProcessor(_)", wren_raylib_detach_audio_mixed_processor},
 });
 
 pub const ForeignClass = struct { allocate: ?*const WrenForeignClassAllocatorFn };
 
 pub const ForeignClassBindings = std.StaticStringMap(ForeignClass).initComptime(.{
    .{ "raylib.Color", ForeignClass{ .allocate = Color.allocate } },
    .{ "raylib.RenderTexture2D", ForeignClass{ .allocate = RenderTexture2D.allocate } },
    .{ "raylib.Camera2D", ForeignClass{ .allocate = Camera2D.allocate } },
    .{ "raylib.Vector2", ForeignClass{ .allocate = Vector2.allocate } },
    .{ "raylib.Rectangle", ForeignClass{ .allocate = Rectangle.allocate } },
 });
class Raylib {
 foreign static initAudioDevice()
 foreign static closeAudioDevice()
 foreign static isAudioDeviceReady()
 foreign static setMasterVolume(a)
 foreign static getMasterVolume()
 foreign static loadWave(a)
 foreign static loadWaveFromMemory(a,b,c)
 foreign static isWaveValid(a)
 foreign static loadSound(a)
 foreign static loadSoundFromWave(a)
 foreign static loadSoundAlias(a)
 foreign static isSoundValid(a)
 foreign static updateSound(a,b,c)
 foreign static unloadWave(a)
 foreign static unloadSound(a)
 foreign static unloadSoundAlias(a)
 foreign static exportWave(a,b)
 foreign static exportWaveAsCode(a,b)
 foreign static playSound(a)
 foreign static stopSound(a)
 foreign static pauseSound(a)
 foreign static resumeSound(a)
 foreign static isSoundPlaying(a)
 foreign static setSoundVolume(a,b)
 foreign static setSoundPitch(a,b)
 foreign static setSoundPan(a,b)
 foreign static waveCopy(a)
 foreign static waveCrop(a,b,c)
 foreign static waveFormat(a,b,c,d)
 foreign static loadWaveSamples(a)
 foreign static unloadWaveSamples(a)
 foreign static loadMusicStream(a)
 foreign static loadMusicStreamFromMemory(a,b,c)
 foreign static isMusicValid(a)
 foreign static unloadMusicStream(a)
 foreign static playMusicStream(a)
 foreign static isMusicStreamPlaying(a)
 foreign static updateMusicStream(a)
 foreign static stopMusicStream(a)
 foreign static pauseMusicStream(a)
 foreign static resumeMusicStream(a)
 foreign static seekMusicStream(a,b)
 foreign static setMusicVolume(a,b)
 foreign static setMusicPitch(a,b)
 foreign static setMusicPan(a,b)
 foreign static getMusicTimeLength(a)
 foreign static getMusicTimePlayed(a)
 foreign static loadAudioStream(a,b,c)
 foreign static isAudioStreamValid(a)
 foreign static unloadAudioStream(a)
 foreign static updateAudioStream(a,b,c)
 foreign static isAudioStreamProcessed(a)
 foreign static playAudioStream(a)
 foreign static pauseAudioStream(a)
 foreign static resumeAudioStream(a)
 foreign static isAudioStreamPlaying(a)
 foreign static stopAudioStream(a)
 foreign static setAudioStreamVolume(a,b)
 foreign static setAudioStreamPitch(a,b)
 foreign static setAudioStreamPan(a,b)
 foreign static setAudioStreamBufferSizeDefault(a)
 foreign static setAudioStreamCallback(a,b)
 foreign static attachAudioStreamProcessor(a,b)
 foreign static detachAudioStreamProcessor(a,b)
 foreign static attachAudioMixedProcessor(a)
 foreign static detachAudioMixedProcessor(a)

} 


