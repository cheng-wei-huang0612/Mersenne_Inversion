import jinja2
from jinja2 import Environment, BaseLoader
import numpy as np


class Prepare_Vec_uuvvrrss:
    def __init__(self):
        pass

    def emit_C_reference(self):
        template = Environment(loader=BaseLoader()).from_string(
r"""

#include <arm_neon.h>
void prepare_vec_uuvvvrrss(uint32x4_t *vec_uu0_rr0_vv0_ss0, uint32x4_t *vec_uu1_rr1_vv1_ss1, const uint32x4_t vec_4x_2p30m1, int64_t *uu, int64_t *vv, int64_t *rr, int64_t *ss) {
    int32_t uu0 = (int32_t)(*uu & 0x3fffffff);
    int32_t vv0 = (int32_t)(*vv & 0x3fffffff);
    int32_t rr0 = (int32_t)(*rr & 0x3fffffff);
    int32_t ss0 = (int32_t)(*ss & 0x3fffffff);

    *vec_uu0_rr0_vv0_ss0 = (uint32x4_t){(uu0), (rr0), (vv0), (ss0)};

    int32_t uu1 = *uu >> 30;
    int32_t vv1 = *vv >> 30;
    int32_t rr1 = *rr >> 30;
    int32_t ss1 = *ss >> 30;
    *vec_uu1_rr1_vv1_ss1 = (uint32x4_t){(uu1), (rr1), (vv1), (ss1)};
}
""")
        return template.render()



    def prepare_vec_uuvvvrrss(self, vec_uu0_rr0_vv0_ss0, vec_uu1_rr1_vv1_ss1, vec_4x_2p30m1, uu, vv, rr, ss):
        template = Environment(loader=BaseLoader()).from_string(
            
'''
ins {{ vec_uu0_rr0_vv0_ss0 }}.s[0], %wregname{{ uu }}
ins {{ vec_uu0_rr0_vv0_ss0 }}.s[1], %wregname{{ rr }}
ins {{ vec_uu0_rr0_vv0_ss0 }}.s[2], %wregname{{ vv }}
ins {{ vec_uu0_rr0_vv0_ss0 }}.s[3], %wregname{{ ss }}
and {{ vec_uu0_rr0_vv0_ss0 }}.16b, {{ vec_uu0_rr0_vv0_ss0 }}.16b, {{ vec_4x_2p30m1 }}.16b

asr {{ uu }}, {{ uu }}, #30
asr {{ vv }}, {{ vv }}, #30
asr {{ rr }}, {{ rr }}, #30
asr {{ ss }}, {{ ss }}, #30

ins {{ vec_uu1_rr1_vv1_ss1 }}.s[0], %wregname{{ uu }}
ins {{ vec_uu1_rr1_vv1_ss1 }}.s[1], %wregname{{ rr }}
ins {{ vec_uu1_rr1_vv1_ss1 }}.s[2], %wregname{{ vv }}
ins {{ vec_uu1_rr1_vv1_ss1 }}.s[3], %wregname{{ ss }}

'''

)
        return template.render(
            vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
            vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
            vec_4x_2p30m1=vec_4x_2p30m1,
            uu=uu,
            vv=vv,
            rr=rr,
            ss=ss
        )

    # not faster, TODO: replace stp/ldp by mov
    def prepare_vec_uuvvvrrss_2(self, vec_uu0_rr0_vv0_ss0, vec_uu1_rr1_vv1_ss1, vec_4x_2p30m1, uu, vv, rr, ss, vec_uu_rr, vec_vv_ss):
        template = Environment(loader=BaseLoader()).from_string(
            
'''
stp {{ uu }}, {{ rr }}, [sp, #-16]
stp {{ vv }}, {{ ss }}, [sp, #-32]
ldp %qregname{{ vec_vv_ss }}, %qregname{{ vec_uu_rr }}, [sp, #-32]

uzp1 {{ vec_uu0_rr0_vv0_ss0 }}.4s, {{ vec_uu_rr }}.4s, {{ vec_vv_ss }}.4s
and {{ vec_uu0_rr0_vv0_ss0 }}.16b, {{ vec_uu0_rr0_vv0_ss0 }}.16b, {{ vec_4x_2p30m1 }}.16b
sshr {{ vec_uu_rr }}.2d, {{ vec_uu_rr }}.2d, #30
sshr {{ vec_vv_ss }}.2d, {{ vec_vv_ss }}.2d, #30
uzp1 {{ vec_uu1_rr1_vv1_ss1 }}.4s, {{ vec_uu_rr }}.4s, {{ vec_vv_ss }}.4s

'''

)
        return template.render(
            vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
            vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
            vec_4x_2p30m1=vec_4x_2p30m1,
            uu=uu,
            vv=vv,
            rr=rr,
            ss=ss,
            vec_uu_rr=vec_uu_rr,
            vec_vv_ss=vec_vv_ss
        )



    def prepare_vec_uuvvvrrss_3(self, vec_uu0_rr0_vv0_ss0, vec_uu1_rr1_vv1_ss1, vec_4x_2p30m1, uu, vv, rr, ss, vec_uu_rr, vec_vv_ss):
        template = Environment(loader=BaseLoader()).from_string(

'''
ins {{ vec_uu_rr }}.d[0], {{ uu }}
ins {{ vec_uu_rr }}.d[1], {{ rr }}
ins {{ vec_vv_ss }}.d[0], {{ vv }}
ins {{ vec_vv_ss }}.d[1], {{ ss }}

uzp1 {{ vec_uu0_rr0_vv0_ss0 }}.4s, {{ vec_uu_rr }}.4s, {{ vec_vv_ss }}.4s
and {{ vec_uu0_rr0_vv0_ss0 }}.16b, {{ vec_uu0_rr0_vv0_ss0 }}.16b, {{ vec_4x_2p30m1 }}.16b
sshr {{ vec_uu_rr }}.2d, {{ vec_uu_rr }}.2d, #30
sshr {{ vec_vv_ss }}.2d, {{ vec_vv_ss }}.2d, #30
uzp1 {{ vec_uu1_rr1_vv1_ss1 }}.4s, {{ vec_uu_rr }}.4s, {{ vec_vv_ss }}.4s

'''

)
        return template.render(
            vec_uu0_rr0_vv0_ss0=vec_uu0_rr0_vv0_ss0,
            vec_uu1_rr1_vv1_ss1=vec_uu1_rr1_vv1_ss1,
            vec_4x_2p30m1=vec_4x_2p30m1,
            uu=uu,
            vv=vv,
            rr=rr,
            ss=ss,
            vec_uu_rr=vec_uu_rr,
            vec_vv_ss=vec_vv_ss
        )

if __name__ == "__main__":
    prep = Prepare_Vec_uuvvrrss()
    print(prep.emit_C_reference())
