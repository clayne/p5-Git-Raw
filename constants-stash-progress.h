
/* remap stash enum's to defines */
#define NONE                GIT_STASH_APPLY_PROGRESS_NONE
#define LOADING_STASH       GIT_STASH_APPLY_PROGRESS_LOADING_STASH
#define ANALYZE_INDEX       GIT_STASH_APPLY_PROGRESS_ANALYZE_INDEX
#define ANALYZE_MODIFIED    GIT_STASH_APPLY_PROGRESS_ANALYZE_MODIFIED
#define ANALYZE_UNTRACKED   GIT_STASH_APPLY_PROGRESS_ANALYZE_UNTRACKED
#define CHECKOUT_UNTRACKED  GIT_STASH_APPLY_PROGRESS_CHECKOUT_UNTRACKED
#define CHECKOUT_MODIFIED   GIT_STASH_APPLY_PROGRESS_CHECKOUT_MODIFIED
#define DONE                GIT_STASH_APPLY_PROGRESS_DONE

#include "const-c-stash-progress.inc"

#undef NONE
#undef LOADING_STASH
#undef ANALYZE_INDEX
#undef ANALYZE_MODIFIED
#undef ANALYZE_UNTRACKED
#undef CHECKOUT_UNTRACKED
#undef CHECKOUT_MODIFIED
#undef DONE
