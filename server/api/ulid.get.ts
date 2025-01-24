import {ulid} from '@std/ulid'
export default defineEventHandler(() => {
    return { id: ulid() }
})
