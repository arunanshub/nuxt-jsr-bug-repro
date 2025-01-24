<script lang="ts" setup>
const { data } = await useFetch('/api/ulid')
</script>

<template>
  <div>
    my ulid: {{ data?.id }}
  </div>
</template>
