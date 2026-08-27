#!/usr/bin/env python3
"""
Predator 3D Rotating Emblem for Fastfetch
Smoothly rotates a 3D Acer Predator emblem with lighting, perspective, and depth
alongside the Omarchy system information modules.
"""

import os
import sys
import time
import math
import struct
import zlib
import base64
import shutil
import subprocess
import signal
import select

# Embedded 3D Mesh Data
MESH_DATA = "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4ZcX9bA7qIfdOz2c3h30DsLuYB872McO9rGDfexgHzvYxw72sYN97GAfO9jHDvaxg33sYB872McO9rGDfexgHzvYxw72sYN97GAfe9fHDt7t3cE+drD/y3PbPuxjy/rYsj62rI8t62PL+tgys3Bl4crClf30a33sXR9718fe9bF3fexdH3vXx971sXd97F0fe9fH3vWxd33sXR9718fe9bF3fexdH3vXx971sXd97F0fe9fH3vWxd33sXR9718fe9bF3fexdH3vXx971sWt97N3d3r3rY+/62Ls+9q6Pvetj7/rYuz72ro+962Pv+ti7Pvauj73rY+/62Ls+9q6Pvetj7/rYuz72ro+962Pv+ti7Pvauj73rY+/62Ls+9q6Pvetj7/rYuz72ro+962Pv+ti7Pvauj73rY+/62Ls+9q6Pvbvb167BtWtw7drbz/SxiX1sYh+b2Mcmml0618eu9bFrfexaH7vWx671sWt97Fofu9bHrvWxa33sWh+71seu9bFrfexaH7vWx671sWt97Fofu9bHfvWxa3d7d62PXetj13Y6d22nc9d2Ondtp3PXdjp3zSzsrulhd00Pu2v6w/Cbe3rYXdPD7poedtf0sPulH9zj3TU+u1zP7cVrZmG3iWztEVnZbTIL+zOaWbiycGXfed0s7H7pJ+Ev3dDD7pcedr/0sPulh90v/UH4jZEedr/0sPulh90vPex+6dvwqxM97H7pYfdLD7tTeji9++XZgN0vs7D75Z2C3S/v1NaMWdj90sPulx52v/Sw+6XfD78+q4fdLz3sfulh90sPu1/6JvzKnB52v/Sw+6WH3S897H7pL4c/f1oPp6+tgWtr4Nqaf3rYLOzGmYXdOLNL58zC7pRnA3anPBvDyA4ju7agh90pPexO6WF3Sg+7U/qd8MuLetid0sPukR5O7055p2B3auN1d2rjdXdq43V3auN1d2rjdXfKLOxO6WF3Sg+7U/rD8Jt7etid0sPulB52p/Swe6Qf3OPdKT67XM/t06+Zhd0astM/L4Prz9Hg+nO0d143C7s1+kn4Szf0sFujh90aPezW6GG3Rn8QfmOkh90aPezW6GG3Rg+7Nfo2/OpED7s1etit0cNuih5O79b4fmG3xizs1ngvYLfGe7E1YxZ2a/SwW6OH3Ro97Nbo98Ovz+pht0YPuzV62K3Rw26Nvgm/MqeH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"

def decode_mesh():
    raw = zlib.decompress(base64.b64decode(MESH_DATA))
    n = len(raw) // 12
    pts = []
    for i in range(n):
        x, y, z, nx, ny, nz = struct.unpack_from("<6h", raw, i * 12)
        pts.append((x / 10000.0, y / 10000.0, z / 10000.0, nx / 10000.0, ny / 10000.0, nz / 10000.0))
    return pts

POINTS = decode_mesh()

# Rendering Constants
RAMP = " .:-=+*#%@"
LOGO_W = 46
LOGO_H = 26
X_SCALE = 1.95
Y_SCALE = 1.05
PERSPECTIVE = 0.22
SPEED = 1.8
FPS = 30

# Colors
C_CYAN_BRIGHT = "\033[1;96m"
C_CYAN = "\033[38;5;51m"
C_CYAN_DEEP = "\033[38;5;45m"
C_CYAN_DIM = "\033[38;5;31m"
C_WHITE = "\033[1;97m"
C_RESET = "\033[0m"

def get_system_info():
    cmd = ["/usr/bin/fastfetch", "--logo", "none"]
    try:
        out = subprocess.check_output(cmd, stderr=subprocess.DEVNULL).decode("utf-8", errors="replace")
        return [l.rstrip() for l in out.splitlines()]
    except Exception:
        return []

def render_logo(angle):
    grid = [[" " for _ in range(LOGO_W)] for _ in range(LOGO_H)]
    zbuf = [[-999.0 for _ in range(LOGO_W)] for _ in range(LOGO_H)]
    
    ca = math.cos(angle)
    sa = math.sin(angle)
    
    # Light source vector
    lx, ly, lz = 0.4, -0.3, 0.8
    l_len = math.sqrt(lx * lx + ly * ly + lz * lz)
    lx, ly, lz = lx / l_len, ly / l_len, lz / l_len
    
    for x, y, z, nx, ny, nz in POINTS:
        xr = x * ca + z * sa
        zr = -x * sa + z * ca
        
        nxr = nx * ca + nz * sa
        nzr = -nx * sa + nz * ca
        
        scale = 1.0 / max(0.4, 1.0 - zr * PERSPECTIVE)
        xp = xr * scale * X_SCALE
        yp = y * scale * Y_SCALE
        
        gx = int((xp + 1.0) * 0.5 * (LOGO_W - 1))
        gy = int((yp + 1.0) * 0.5 * (LOGO_H - 1))
        
        if 0 <= gx < LOGO_W and 0 <= gy < LOGO_H:
            if zr > zbuf[gy][gx]:
                zbuf[gy][gx] = zr
                dot = nxr * lx + ny * ly + nzr * lz
                diffuse = max(0.12, dot)
                specular = pow(max(0.0, dot), 6) * 0.45
                rim = 0.25 * (1.0 - abs(nzr))
                lum = min(1.0, diffuse + specular + rim)
                
                char_idx = int(lum * (len(RAMP) - 1))
                char = RAMP[char_idx]
                
                # Colorize based on luminance/specular
                if lum > 0.85:
                    col = C_WHITE
                elif lum > 0.60:
                    col = C_CYAN_BRIGHT
                elif lum > 0.35:
                    col = C_CYAN
                else:
                    col = C_CYAN_DEEP
                
                grid[gy][gx] = col + char + C_RESET

    return ["".join(row) for row in grid]

def composite_frame(logo_lines, info_lines, term_w):
    num_lines = max(len(logo_lines), len(info_lines))
    combined = []
    
    padding_left = "  "
    padding_between = "    "
    
    for i in range(num_lines):
        logo_part = logo_lines[i] if i < len(logo_lines) else (" " * LOGO_W)
        info_part = info_lines[i] if i < len(info_lines) else ""
        combined.append(f"{padding_left}{logo_part}{padding_between}{info_part}")
        
    return "\n".join(combined)

def restore_terminal(old_settings=None):
    sys.stdout.write("\033[?25h" + C_RESET)
    sys.stdout.flush()
    if old_settings is not None:
        try:
            import termios
            termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)
        except Exception:
            pass

def main():
    args = sys.argv[1:]
    if args:
        if args[0] in ("-s", "--static"):
            os.execv("/usr/bin/fastfetch", ["fastfetch"] + args[1:])
        else:
            os.execv("/usr/bin/fastfetch", ["fastfetch"] + args)
            
    if not sys.stdout.isatty() or not sys.stdin.isatty():
        os.execv("/usr/bin/fastfetch", ["fastfetch"])

    info_lines = get_system_info()
    
    old_settings = None
    try:
        import termios
        import tty
        old_settings = termios.tcgetattr(sys.stdin)
        tty.setcbreak(sys.stdin.fileno())
    except Exception:
        pass

    def handle_sigint(sig, frame):
        restore_terminal(old_settings)
        sys.exit(0)

    signal.signal(signal.SIGINT, handle_sigint)
    signal.signal(signal.SIGTERM, handle_sigint)

    sys.stdout.write("\033[?25l")
    sys.stdout.flush()

    start_time = time.monotonic()
    last_frame_str = ""

    try:
        total_render_lines = max(LOGO_H, len(info_lines))
        
        while True:
            r, _, _ = select.select([sys.stdin], [], [], 0)
            if r:
                sys.stdin.read(1)
                break

            term_w, term_h = shutil.get_terminal_size((100, 30))
            now = time.monotonic()
            angle = (now - start_time) * SPEED
            
            logo_lines = render_logo(angle)
            frame_str = composite_frame(logo_lines, info_lines, term_w)
            
            if last_frame_str:
                sys.stdout.write(f"\033[{total_render_lines}A\r")
            
            sys.stdout.write(frame_str + "\n")
            sys.stdout.flush()
            last_frame_str = frame_str
            
            time.sleep(1.0 / FPS)

    except KeyboardInterrupt:
        pass
    finally:
        restore_terminal(old_settings)
        print()

if __name__ == "__main__":
    main()
