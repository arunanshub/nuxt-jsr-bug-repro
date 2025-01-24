<script lang="ts" setup>
const { data, error } = await useFetch('/api/ulid')

if (error.value) {
  throw createError({ message: error.value.message, fatal: true, statusCode: 500 })
}
</script>

<template>
  <div>
    my ulid: {{ data?.id }}
  </div>
</template>
